<template>
    <div class="left-side">
        <main-search></main-search>
        <div class="select-container">
            <factor-box v-for="parent in parent_list" :parent-info="parent"></factor-box>
        </div>
    </div>
</template>

<script>

import factorBox from './factorBox'
import mainSearch from './mainSearch'
import messageBus from '../bus/messageBus.js'

export default {
    data() {
        return {
            factorCount:0,
            parent_list:[
                {factor:'Topic',children:[
                    {name: 'agriculture',bgc:'#ea5545',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'biodiversity',bgc:'#0000ff',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'climate',bgc:'#87bc45',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'disaster',bgc:'#f46a9b',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'energy',bgc:'#ff0000',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'ecosystems',bgc:'#bdcf32',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'geology',bgc:'#00ff00',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'health',bgc:'#ef9b20',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'water',bgc:'#43CD80',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name: 'weather',bgc:'#edbf33',factorBgc:'#1C1C1C',factorSelectClose:false}]},
                {factor:'Publisher',children:[
                    {name:'NASA',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'NOAA',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'USGS',factorBgc:'#1C1C1C',factorSelectClose:false}]},
                {factor:'Data Type',children:[
                    {name:'Service',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'Layer',factorBgc:'#1C1C1C',factorSelectClose:false}]},
                {factor:'CRS',children:[
                    {name:'EPSG:4326',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:3411',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:23031',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:25830',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:32620',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:2154',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:32738',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:2975',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:3857',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:31277',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:31276',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:27700',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:5514',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:31467',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:25832',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:2177',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:900913',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:3067',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:25831',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'EPSG:2176',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'CRS:1',factorBgc:'#1C1C1C',factorSelectClose:false},
                    {name:'CRS:84',factorBgc:'#1C1C1C',factorSelectClose:false}]}
            ]
        }
    },
    mounted(){
        this.factorCountUpdate();
    },
    methods:{
        //搜搜条件选项为0,则传递给RightsideBar提供初始化加载WMS列表
        factorCountUpdate:function(){
            messageBus.$on('factorCount-update',(par)=>{
                this.factorCount = this.factorCount + par;
                if (this.factorCount === 0) {
                    messageBus.$emit('service-list-data-search','reset');
                }
            })
        }
    },
    components: {
        factorBox,
        mainSearch
    }
}
</script>

<style>
.left-side {
    position: absolute;
    top:0.5%;
    left: 0.2%;
    width: 8%;
    height:99.5%;
}
.select-container{
    position: absolute;
    top:4.5%;
    left: 0;
    width: 100%;
    height:95%;
}

</style>
