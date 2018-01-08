<template>
    <div>
        <div id="leaflet-map"></div>
        <input type="range" class="range" min="2" max="9" step="1" id="range" @click="changeGridSize()">
        <!--<div class="pop-container" id="pop-container">
            <a>BoundingBox:<span>{{boundingbox}}</span></a><br/>
            <a>Highest frequency topic:<span>{{high_topic}}</span></a>
            <div id="myChart"></div>
        </div>-->
        <div id="legend"></div>
    </div>
    

</template>

<script>
    import echarts from 'echarts';
    import Leaflet from 'leaflet'
    import messageBus from '../bus/messageBus.js'

    var osmurl = "https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZ2VtbWFhYWEiLCJhIjoiY2o2a2N5dzB1MWd1ZTMzcnlqMDhkM3ZjYyJ9.0vVVkY9k7t8z0e3uqMgQnQ";
    
    export default {
        data() {
            return {
                parent_list:[
                    {name: 'agriculture',bgc:'#ea5545',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'biodiversity',bgc:'#0000ff',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'climate',bgc:'#87bc45',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'disaster',bgc:'#f46a9b',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'energy',bgc:'#ff0000',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'ecosystems',bgc:'#bdcf32',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'geology',bgc:'#00ff00',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'health',bgc:'#ef9b20',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'water',bgc:'#43CD80',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'weather',bgc:'#edbf33',factorBgc:'#1C1C1C',factorSelectClose:false}],
                layerCount:1,
                high_topic:'',
                boundingbox:'',
                map: null,
                layer: null,
                wms: null,
                layer_name:null,
                style_name:'wms',
                featureGroup:null,
                drawControl:null,
                globalLayer:null,
                viewValue:'WMS View',
                wmsCircle:[],
                //chartData:[],
                //chartContainer:null,
                service_list_update:[],
                searchGrid:null,
                topic:'',
                color:'',
                publisher:'',
                crs:'',
                layer_content:'',
                bbox:null,
                wmsLat:null,
                wmsLng:null,
                dataType:'Service',
                array_temp:[],
                map_config: {
                    zoom: 2,
                    center: [30, 3],
                    minZoom:1,
                    maxZoom: 18
                }
            };
        },
        mounted(){
            //初始化地图
            this.map = L.map("leaflet-map",{
                    center: this.map_config.center,
                    zoom: this.map_config.zoom,
                    minZoom: this.map_config.minZoom,
                    maxZoom: this.map_config.maxZoom,
                    projection:L.Projection.LonLat,

                });
            L.tileLayer(osmurl).addTo(this.map);

            this.loadLayer();
            this.loadwms();
            this.addWMS();
            this.loadServiceList();
            this.loadTopicSelect();

            this.defineLayer_Style(this.viewValue,this.style_name);
            //this.chartContainer = document.getElementById('pop-container');

            this.handleLegend(this.viewValue);
        },
        watch:{
            array_temp:function(){
                messageBus.$emit('search-box',this.array_temp);
            }
        },
        methods: {
            //回传加载factorBox中主题的选择
            loadTopicSelect:function(){
                messageBus.$on('Topic',(topic)=>{
                    this.topic = topic;
                    this.clearAll();
                    this.defineLayer_Style(this.viewValue,this.topic); 
                });
                messageBus.$on('Publisher',(factor) =>{
                    this.publisher = factor;
                });
                messageBus.$on('CRS',(factor) =>{
                    this.crs = factor;
                });
                messageBus.$on('Data Type',(factor) =>{
                    this.ClearNotEmptyLayer(this.searchGrid);
                    this.clearAll();
                    this.dataType = factor;
                    if (this.dataType === 'Layer') {
                        this.viewValue = 'Grid View';                        
                        this.gridViewContent();
                        this.handleLegend(this.viewValue);
                    }else{
                        this.displayRange();
                        this.viewValue = 'WMS View';
                        this.handleLegend(this.viewValue);
                        if ((this.topic === '') && (this.crs === '') && (this.publisher === '')) {
                            this.style_name = 'wms';            
                            this.defineLayer_Style(this.viewValue,this.style_name);                   
                        }
                    }
                    messageBus.$emit('view-change',this.viewValue);
                });
            },
            //回传加载树形列表数据内容
            loadServiceList:function(){
                messageBus.$on('service-list-data-search',(service_list_update) => {
                    this.service_list_update = service_list_update;
                    if (this.dataType === 'Service') {
                        this.updateWMSDistribution();
                    }                   
                });
            },
            //根据搜索结果更新WMS分布图
            updateWMSDistribution:function(){
                if ((this.viewValue === 'WMS View') | (this.viewValue === 'Grid View' && this.searchGrid != null)) {
                    //this.chartContainer.style.display = 'none';
                    this.clearAll();
                    this.wmsCircle = []
                    var layer;
                    for (var i = 0; i <this.service_list_update.length; i++) {
                        var lat = this.service_list_update[i].Latitude;
                        var lng = this.service_list_update[i].Longitude;
                        var core_top = this.service_list_update[i].Core_Topic;
                        if (core_top != "No Topic") {
                            this.DefineColor(core_top);
                            layer = L.circle([lat,lng],{
                                radius:5,
                                color: this.color
                            })
                            this.wmsCircle.push(layer);
                        }
                       
                    }
                    
                    this.globalLayer = L.layerGroup(this.wmsCircle).addTo(this.map);
                }                     
            },
            //根据视图添加图层
            addWMS: function(){
                messageBus.$on('view-update',(viewValue) => {
                    this.array_temp = [];
                    this.viewValue = viewValue;
                    this.handleLegend(this.viewValue);
                    //选定WMS View的时候
                    this.clearAll();
                    this.ClearNotEmptyLayer(this.searchGrid);
                    this.searchGrid = null;
                    this.loadTopicSelect();
                    this.map.removeEventListener('click');
                    if (this.viewValue === 'Grid View') {
                        this.gridViewContent();                  
                        this.map.on('click',this.LoadGridByClick);
                        messageBus.$on('grid-search-result',(grid_information)=>{

                            var bbox = (grid_information[0].BoundingBox).split(',');
                            
                            var point1 = bbox[0].split(' ');
                            var point2 = bbox[1].split(' ');
                            var latmin = parseFloat(point1[1]);
                            var latmax = parseFloat(point2[1]);
                            var lngmin = parseFloat(point1[0]);
                            var lngmax = parseFloat(point2[0]);
                            this.ClearNotEmptyLayer(this.searchGrid);
                            this.searchGrid = L.polygon([
                                [latmin,lngmin],
                                [latmin,lngmax],
                                [latmax,lngmax],
                                [latmax,lngmin]
                            ]).addTo(this.map);
                            this.handleLegend('WMS View');
                            this.array_temp=[latmin,latmax,lngmin,lngmax]
                            
                            /*this.boundingbox = grid_information[0].BoundingBox;
                            this.high_topic = grid_information[0].Core_Topic;
                            this.chartContainer.style.display = 'block';
                            
                            var chartList = [];
                            chartList.push(parseInt(grid_information[0].agriculture))
                            chartList.push(parseInt(grid_information[0].biodiversity))
                            chartList.push(parseInt(grid_information[0].climate))
                            chartList.push(parseInt(grid_information[0].disaster))
                            chartList.push(parseInt(grid_information[0].ecosystems))
                            chartList.push(parseInt(grid_information[0].energy))
                            chartList.push(parseInt(grid_information[0].geology))
                            chartList.push(parseInt(grid_information[0].health))
                            chartList.push(parseInt(grid_information[0].water))
                            chartList.push(parseInt(grid_information[0].weather))
                            this.chartData = chartList;
                            this.drawChart();
                            this.searchGrid.bindPopup(grid_information[0].BoundingBox,{
                                closeButton: false,
                                minWidth: 120,
                            });*/
                        });
                        messageBus.$on('Topic',(topic)=>{
                            this.globalLayer.remove();
                            this.style_name = this.topic;
                            this.DefineWMSLayer(this.layer_name,this.style_name)
                        });
                    }else{
                        if (this.viewValue === 'WMS View') {
                            if (this.dataType === 'Layer') {
                                this.dataType = 'Service';
                                messageBus.$emit('Data Type',this.dataType);
                                messageBus.$emit('data-type-change',this.dataType);
                            }else{
                                //如果当前没有选择主题则显示WMS图层，若选择则根据选择绘制散点图
                                if ((this.topic === '') && (this.crs === '') && (this.publisher === '')) {
                                    this.style_name = 'wms';            
                                    this.defineLayer_Style(this.viewValue,this.style_name);                   
                                }else{
                                    this.updateWMSDistribution();
                                }
                            }
                            this.displayRange();                        
                        }
                        if (this.viewValue === 'Country View') {
                            this.displayRange();
                            this.initViewStyle();     
                        }
                        if (this.viewValue === 'Continent View') {
                            this.displayRange();
                            this.initViewStyle();                          
                        }
                    } 
                })
            },
            //点击地图传送单元格信息
            LoadGridByClick:function(e){                            
                var level = parseInt(range.value);
                var GridSize = 45/(Math.pow(2,(level-2)));
                var col = parseInt((e.latlng.lng-(-180))/GridSize);
                var row = parseInt((Math.abs(e.latlng.lat-90))/GridSize);
                var id = '('+level.toString()+','+row.toString()+','+col.toString()+')';
                var search_temp = [id,level]
                messageBus.$emit('search-grid-id',search_temp);
            },
            //控制Grid View下的地图内容
            gridViewContent:function(){
                //显示滑动条，并设置初始化值为4
                let range = document.getElementById('range');
                range.style.display = 'block';
                range.defaultValue = '4';

                this.initViewStyle();                
            },
            //根据视图定义layer_name和style_name，从而确定地图中加载的图层
            defineLayer_Style:function(view,style){
                switch(view){
                    case 'WMS View':
                        this.layer_name = 'wms';
                        this.style_name = style;
                        this.DefineWMSLayer(this.layer_name,this.style_name);
                        break;
                    case 'Country View':
                        style = 'country_'+style;
                        this.layer_name = 'country';
                        this.style_name = style;
                        this.DefineWMSLayer(this.layer_name,this.style_name);
                        break;
                    case 'Continent View':
                        style = 'continent_'+style;
                        this.layer_name = 'continent';
                        this.style_name = style;
                        this.DefineWMSLayer(this.layer_name,this.style_name);
                        break;
                    case 'Grid View':
                        this.style_name = style;
                        this.changeGridSize();
                        break
                }
            },
            //绘制GeoServer发布的WMS图层
            DefineWMSLayer(typeName,styleName){
                var layer_name = 'QoGIS:'+typeName;
                var style_name = 'QoGIS:'+styleName;
                this.globalLayer = L.tileLayer.wms("http://localhost:8081/geoserver/QoGIS/wms", {
                    layers: layer_name,
                    styles:style_name,
                    format: 'image/png',
                    transparent: true
                }).addTo(this.map);   
            },
            //滑动条响应函数
            changeGridSize:function(){
                this.globalLayer.remove();
                var rangeValue = range.value;
                this.layer_name = 'grid'+rangeValue;
                this.DefineWMSLayer(this.layer_name,this.style_name);
            },
            //加载图层信息
            loadLayer:function(){
                messageBus.$on('layer-data',(layer_data) => {
                    var temp = (layer_data.URL).split('?');
                    var url = temp[0];
                    var name = ((temp[1]).split('&')[6]).split('=')[1];
                    this.bbox = ((temp[1]).split('&')[7]).split('=')[1];
                    var abs = layer_data.Abstract;
                    var attr = layer_data.Attribution;
                    var key = layer_data.Keywords;
                    var title = layer_data.Title;
                    var top = layer_data.Topic.split(',');
                    var rel = layer_data.Relevance.split(',');
                    var topic = '';
                    var core_top = layer_data.Core_topic;
                    for (var i = 0; i < top.length; i++) {
                        topic += top[i]+':'+rel[i]+',' 
                    }
                    this.map.removeEventListener('click');
                    this.ClearNotEmptyLayer(this.searchGrid);
                    this.searchGrid = null;
                    this.clearLayerExpIndividualWMS();
                    this.layer = L.tileLayer.wms(url,{
                        layers: name,
                        bbox: this.bbox,
                        format:'image/png',
                        request: 'GetMap',
                        service: 'wms',
                        TRANSPARENT:'true'
                    });
                    this.layer.addTo(this.map);

                    this.layer_content = '<div class="popup" style="z-index:9999"><header>'+name+'<\/header><p>The image can be approached by the layer url <a target="_blank" href='+url+'>'+url+'<\/a>.';
                    if (key != '') {
                        this.layer_content += 'You can search this layer by keywords: <strong>'+key+'<\/strong>'
                    }
                    if (title != '') {
                        this.layer_content += 'The title is <strong>'+title+'<\/strong>'
                    }
                    if (abs != '') {
                        this.layer_content += 'The abstract is <strong>'+abs+'<\/strong>'
                    }
                    if (attr != '') {
                        this.layer_content += 'The attribution of this layer is <strong>'+attr+'<\/strong>'
                    }

                    this.layer_content += '<\/p>'
                    this.layer_content += '<p>This layer covered the geographical range <strong>'+this.bbox+'<\/strong>.<\/p>';
                    this.layer_content += '<p>This map layer is focus on <strong>'+core_top+'<\/strong>. And the topic information of this layer is <strong>'+topic+'<\/strong><\/p><\/div>';
                    
                    this.map.on('click',this.layerClick);
                })
            },
            //定义点击Layer的响应事件
            layerClick:function(e){
                var cor = this.bbox.split(',')
                var latmin = parseFloat(cor[0])
                var latmax = parseFloat(cor[2])
                var lngmin = parseFloat(cor[1])
                var lngmax = parseFloat(cor[3])
                if ((e.latlng.lat > latmin) && (e.latlng.lat < latmax)) {
                    if ((e.latlng.lng>lngmin)&&(e.latlng.lng<lngmax)) {
                        if (e.latlng.lat != this.wmsLat &&  e.latlng.lng != this.wmsLng) {
                            var popup =L.popup();
                            popup.setLatLng(e.latlng)
                                .setContent(this.layer_content)
                                .openOn(this.map);
                        }                       
                    }
                }
            },
            //加载WMS信息，提供点击WMS的信息弹框显示
            loadwms:function(){
                messageBus.$on('wms-data',(wms_data) => {
                    var url = wms_data.url;
                    var abs = wms_data.Abstract;
                    var key = wms_data.Keywords;
                    var title = wms_data.Title;

                    var city = wms_data.City;
                    var state = wms_data.StateOrProvince;
                    var country = wms_data.Country;
                    var district = country+','+state+','+city;

                    var ip = wms_data.IP;
                    var version = wms_data.Version;

                    this.wmsLat = wms_data.Latitude;
                    this.wmsLng = wms_data.Longitude;

                    var core_top = wms_data.Core_Topic;
                    var top = wms_data.Topic.split(',');
                    var rel = wms_data.Relevance.split(',');
                    var topic = '';
                    for (var i = 0; i < top.length; i++) {
                        topic += top[i]+':'+rel[i]+',' 
                    }
                    topic = topic.substring(0,topic.length-1)

                    this.DefineColor(core_top);
                    /*if(this.wms != null){
                        this.wms.remove();
                    };*/
                    this.map.removeEventListener('click');
                    this.ClearNotEmptyLayer(this.searchGrid);
                    this.searchGrid = null;
                    this.clearAll();
                    this.wms = L.circle([this.wmsLat,this.wmsLng],{radius:150000,weight:2,color:'#fff',fillColor:this.color,fillOpacity: 1.0})
                    this.wms.addTo(this.map);

                    var content = '<div class="popup"><header>'+title+'<\/header><p>The detailed capability description can be approached by the url <a target="_blank" href='+url+'>'+url+'<\/a>.';
                    if (key != '') {
                        content += 'You can search this service by keywords: <strong>'+key+'<\/strong>'
                    }
                    if (abs != '') {
                        content += 'The abstract is <strong>'+abs+'<\/strong>'
                    }
                    content += '<\/p>'
                    content += '<p>The service is deployed in <strong>'+this.wmsLat+', '+this.wmsLng+'<\/strong>, which is located in <strong>'+district+'<\/strong>. IP is <strong>'+ip+'<\/strong> and the service version is <strong>'+version+'<\/strong><\/p>';
                    content += '<p>This Service is focus on <strong>'+core_top+'<\/strong>. And the topic information of this service is <strong>'+topic+'<\/strong><\/p><\/div>';
                    this.wms.bindPopup(content,{
                        closeButton: true,
                        minWidth: 350,
                    });
                })
            },
            //若不是GridView则设置range不可见
            displayRange:function(){
                let range = document.getElementById('range');
                range.style.display = 'none';
                //this.chartContainer.style.display = 'none';
            },
            //若当前没有主题选择，则初始化continent View和grid View的加载视图
            initViewStyle:function(){
                if (this.topic === ''){
                    this.defineLayer_Style(this.viewValue,'biodiversity'); 
                }else{
                    this.defineLayer_Style(this.viewValue,this.topic); 
                }
            },
            //清除图层
            clearLayerExpIndividualWMS(){
                if (this.layerCount > 0 ) {
                    this.globalLayer.remove();
                }else{
                    this.layerCount += 1;                            
                };
                this.ClearNotEmptyLayer(this.layer);
                //messageBus.$emit('search-box',[]);
                //this.ClearNotEmptyLayer(this.searchGrid);   
                //this.chartContainer.style.display = 'none';             
            },
            //清除WMS和Layer图层
            clearAll(){
                this.clearLayerExpIndividualWMS();
                this.ClearNotEmptyLayer(this.wms);
            },
            //如果参数图层不为空，则清除
            ClearNotEmptyLayer:function(layer){
                if (layer != null) {
                    layer.remove();
                }
            },
            //定制color
            DefineColor:function(core_top){
                for (var i = 0; i <this.parent_list.length; i++) {
                    if (core_top === this.parent_list[i].name) {
                        this.color = this.parent_list[i].bgc;
                    }
                }
            },
            //控制图例内容
            handleLegend:function(viewValue){
                var legend = document.getElementById('legend');
                var legend_content = '';
                if (viewValue === 'WMS View') {
                    legend_content += '<div class="legend1">';
                    for (var i = 0; i <this.parent_list.length; i++) {
                        legend_content += '<div class="boxaa">';
                        legend_content += '<svg class="topic_icon" style = "background-color:'+this.parent_list[i].bgc+'"><\/svg>';
                        legend_content += '<p class="topic_info">   '+this.parent_list[i].name+'<\/p><\/div>';
                    }          
                    legend_content += '<\/div>';         
                }else{
                    legend_content += '<div class="legend2">';
                    legend_content += '<div class="jieti"><svg style="background-color:#0000ff"><\/svg>';
                    legend_content += '<p> >High Frequency<\/p><\/div>';
                    legend_content += '<svg style="background-color:#0618f0"><\/svg><br/>';
                    legend_content += '<svg style="background-color:#0c30e1"><\/svg><br/>';
                    legend_content += '<svg style="background-color:#1248d2"><\/svg><br/>';
                    legend_content += '<div class="jieti"><svg style="background-color:#1f78b4"><\/svg>';
                    legend_content += '<p> > Low Frequency<\/p><\/div>';
                    legend_content += '<\/div>';  
                };
                legend.innerHTML = legend_content;
            },
            /*drawChart:function(){
                // 基于准备好的dom，初始化echarts实例
                let myChart = echarts.init(document.getElementById('myChart'))
                // 绘制图表
                myChart.setOption({
                    tooltip: {},
                    xAxis: {
                        data: ["Agriculture","Biodiversity","Climate","Disaster","Energy","Ecosystems","Geology","Health","Water","Weather"],
                        type:'category',
                        axisTick:{
                            show: true,
                            alignWithLabel: true,
                            interval: 0
                        },
                        axisLabel:{
                            show:true,
                            interval:0  
                        }
                    },
                    yAxis: {
                        position: {
                            left:0
                        }
                    },
                    series: [{
                        name: 'Topic',
                        type: 'bar',
                        markPoint : {
                            data : [
                                {type : 'max', name: 'Highest Frequency'},
                                {type : 'min', name: 'Lowest Frequency'}
                            ]
                        },
                        data: this.chartData
                    }]
                });
            },*/
        }
    }
                    
</script>

<style>
#leaflet-map {
    position: absolute;
    top:0.5%;
    left: 8.4%;
    width: 76.4%;
    height: 98%;
    background-color: #1C1C1C;
    z-index: 2;
}
.popup header{
    height: 20px;
    font-size: 15px;
    font-weight: bold;
    padding-bottom: 3px;
}
.popup strong{
    color: #0066ff;
}
.range{
    display: none;
    position: absolute;
    bottom: 2%;
    right:18%;
    z-index: 999;
    width: 200px;
    -webkit-box-shadow: 0 1px 0 0px #424242, 0 1px 0 #060607 inset, 0px 2px 10px 0px black inset, 1px 0px 2px rgba(0, 0, 0, 0.4) inset, 0 0px 1px rgba(0, 0, 0, 0.6) inset;
    background-color: #1C1C1C;
    border-radius: 15px;
    -webkit-appearance: none;
    height:10px;
}
.range::-webkit-slider-thumb {
    -webkit-appearance: none;
    cursor: default;
    height: 15px;
    width: 15px;
    transform: translateY(0px);
    background: none repeat scroll 0 0 #777;
    border-radius: 15px;
    -webkit-box-shadow: 0 -1px 1px black inset;
}
.pop-container{
    position: absolute;
    right: 15.5%;
    top: 0.5%;
    background-color: rgba(69,69,69,0.4);
    z-index: 30;
    border-radius: 5px;
    width: 700px;
    height: 240px;
    display: none;
}
.pop-container a{
    top: 4%;
    margin-left: 3%;
    font-weight: bold;
    color: #0066ff;
}
#myChart{
    top: 0px;
    left: 0px;
    width: 700px;
    height: 240px; 
}
.legend1{
    position: absolute;
    bottom:1.5%;
    left: 8.5%;
    width: 110px;
    height: 200px;
    background-color: rgba(69,69,69,0.4);
    z-index: 999;
    border-radius: 6px;
}
.boxaa{
    width: 100%;
    height: 20px;
    padding-bottom: 3px;
}
.topic_icon{
    display: inline;
}
.topic_info{
    display: inline;
    color: #808080;
}
.legend2{
    position: absolute;
    bottom:1.5%;
    left: 8.5%;
    width: 140px;
    height: 100px;
    background-color: rgba(69,69,69,0.4);
    z-index: 999;
    border-radius: 6px;
}
.legend2 svg{
    margin-left: 5px;
    width: 20px;
    height: 10px; 
}
.jieti svg{ 
    display: inline
}
.jieti p{
    display: inline;
    font-size: 10px;
    font-weight: bold;
}
</style>