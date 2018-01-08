<template>
<div class="boxContainer">
    <div class="servicebox" @click="addMarker" ><!--:style="{'border':serviceBorder}"-->
        <a >{{serviceInfo.Title | LongStringFilter }}</a>
        <a @click="openFolder" class="folder">{{open ? '<<'+'hide layers': 'show layers>>'}}</a>
    </div>
    <div v-show="open" class="layer-box">
        <div v-for="child,index in childList" class="layerChild" @click="sendLayerMessage(index)" >
            <img src="../assets/layer icon.png" class="layerIcon">
            <a>{{child.Name  | LongStringFilter }}</a>  
        </div> 
    </div>
</div>
</template>

<script>
import Vue from 'vue'
import messageBus from '../bus/messageBus.js'

Vue.filter('LongStringFilter', (value) => {
    let max_length = 25;
    if (typeof value === 'string') {
        if(value.length > max_length) {
            return value.substring(0, max_length) + ' ...';
        }
    }
    return value;
});

export default {
	data() {
        return {
            dataType:'Service',
            //border: '',
            childList: [],
            selectClose: true,
            open:false
    	}
    },
    props: ['serviceInfo'],//,'serviceBorder','serviceOpen'
    mounted(){
        messageBus.$on('Data Type',(type)=>{
            this.dataType = type;
        });
        //监听folder是否展开
        this.handleFolder();
    },
	methods:{
        //监听来自父组件的值确定是否展开
        handleFolder: function(){
            messageBus.$on('folder-open-handle',(par) =>{
                this.open = par;
            });
        },
        //展开+显示当前WMS或者Layer的子节点
        openFolder(){
            //this.serviceOpen = this.serviceOpen ? false:true;
            this.open = this.open ? false: true;
            if (this.dataType === 'Service') {
                this.$http.post('/api/searchLayer/Search_Layer_By_WMSID',{
                    service_id: this.serviceInfo.id
                },{}).then(function(response){
                    this.childList = response.body;
                });
            }
            else{
                this.$http.post('/api/searchWMSByLayerId/Search_WMS_By_LayerID',{
                    layerId: this.serviceInfo.id
                },{}).then(function(response){
                    this.childList = response.body;
                });
            }
            
        },
        //点击子节点，地图上显示对应的WMS或者Layer
        sendLayerMessage(index){          
            if (this.dataType === 'Service') {
                messageBus.$emit('layer-data',this.childList[index]);
            }else{
                messageBus.$emit('wms-data',this.childList[index]); 
            }
            
        },
        //点击节点，地图上显示对应的WMS或者Layer
        addMarker(){
            //改变节点的边框样式
            var par = 1;
            messageBus.$emit('select-service-count',par);
            //this.serviceBorder = '1px solid red';
            //let btn = document.getElementsByClassName('servicebox');
            //btn[0].style.border = '1px solid red';
            //根据数据类型添加孩子节点的内容
            if (this.dataType === 'Service') {
                messageBus.$emit('wms-data',this.serviceInfo);
            }else{
                messageBus.$emit('layer-data',this.serviceInfo); 
            }
        }
    }
}
</script>

<style>
.boxContainer{
    height: auto;
    margin-left: 1%;   
    margin-bottom: 1.6%;  
}
.servicebox{
    height: 26px;
    border-radius:2px;
    background-color:#454545;
}
.servicebox a{
    font-size: 12px;
    color: #000;
    margin-top: 4px;
    margin-left:2%;
    display: inline;
}
.folder{
    font-size: 12px;
    float: right;
    display: inline;
    margin-right: 4px;
}
.layer-box{
    height: auto;
    width: 98%;
    right: 1%;
    margin-left: 1%;
    background-color: #1C1C1C;
    margin-bottom: 3%;
    margin-top: 1%;
}
.layerChild{
    height: 16px;
    margin-bottom: 3px;
}
.layerChild a{
    font-size: 12px;
    color:#696969;
    font-weight: bold;
    margin-top: 0px;
    margin-left: 3%;
}
.layerChild .layerIcon{
    width: 13px;
}
</style>
