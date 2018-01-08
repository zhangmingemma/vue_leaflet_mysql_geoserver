<template>
	<div id="main-search" class="control has-icon">
		<input class="input" type="text" placeholder="Search..." v-model="query"
		@keydown.enter="hit" >
		<i class="fa fa-search"></i>
		<i class="fa fa-times icon-close" @click="resetSearch()" v-show="query.length"></i>
    </div>
</template>

<script>
import messageBus from '../bus/messageBus.js'

export default {
	data() {
        return {
        	query: '',
            topic:'',
            publisher:'',
            crs:'',
            box:'',
            dataType:'Service'
        }
    },
    mounted(){
        this.factorUpdate();
        this.searchGrid();
        messageBus.$on('Data Type',(type)=>{
            this.dataType = type;
            this.SearchLayerOrService(this.dataType);
        });
    },
    methods:{
        //点击格网，搜索格网信息
        searchGrid:function(){
            messageBus.$on('search-grid-id',(arr) => {
                var id = arr[0]  
                var table_name = 'grid_zoom'+arr[1].toString();
                if (this.dataType === 'Service') {
                    this.$http.post('/api/searchGrid/SearchGrid',{
                        id:id,
                        table:table_name
                    },{}).then(function(response){
                        messageBus.$emit('grid-search-result',response.body);
                    })
                }else{ 
                    alert('Layer can not support search by grid');
                }
            })
            
        },
        //搜索框重置
    	resetSearch: function(){
    		this.query = '';
            var par = -1;
            messageBus.$emit('factorCount-update',par);
            this.SearchLayerOrService(this.dataType);    
    	},
        //搜索框搜索
    	hit:function(){
            this.searchRequest(); 
            var par = 1;
            messageBus.$emit('factorCount-update',par);      
    	},
        //进行WMS搜索
        searchRequest:function(){
            this.$http.post('/api/searchWMSByFactor/Search_WMS',{
                keyword: this.query,
                topic: this.topic,
                publisher:this.publisher,
                crs:this.crs,
                box:this.box
            },{})           
            .then(function(response){
                messageBus.$emit('service-list-data-search',response.body);
            })
        },
        //进行Layer搜索
        searchRequest_Layer:function(){
            this.$http.post('/api/searchLayerByFactor/Search_Layer',{
                keyword: this.query,
                topic: this.topic,
                publisher:this.publisher,
                crs:this.crs,
            },{}).then(function(response){
                messageBus.$emit('service-list-data-search',response.body);
            })
        },
        //根据搜索条件进行搜索
        factorUpdate:function(){
            messageBus.$on('Topic',(factor) => {
                this.topic = factor;  
                this.SearchLayerOrService(this.dataType);                           
            });
            messageBus.$on('Publisher',(factor) =>{
                this.publisher = factor;
                this.SearchLayerOrService(this.dataType);
            });
            messageBus.$on('CRS',(factor) =>{
                this.crs = factor;
                this.SearchLayerOrService(this.dataType);
            });
            messageBus.$on('search-box',(array)=>{
                this.box = array;
                this.SearchLayerOrService(this.dataType);
            });
        },
        SearchLayerOrService: function(dataType){
            if (dataType === 'Service') {
                this.searchRequest();
            }else{
                this.searchRequest_Layer();
            }
        }
    }
}

</script>

<style>
#main-search{
    position: absolute;
    top:0.2%;
    left: 0.5%;
    width: 99%;
}
#main-search input {
    border-radius: 0;
    margin-top: 0;
    background-color: #1C1C1C;
    border: 1px solid #454545;
    color: #696969;
}

#main-search input:focus {
    border: 1px solid #ed6c63;
}
#main-search i.icon-close {
        left: auto;
        right: 4px;
        color: #69707a;
        cursor: pointer;
        pointer-events: auto;
    }
</style>
