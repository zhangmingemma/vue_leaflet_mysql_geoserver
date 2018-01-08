<template>
    <div>
        <div id="Content_container">
            <div class="Count-canel" id="Count-Canel">
                <p><span>{{serviceCount}}</span> {{typeName}}s found</p>
            </div>
            <div class="Load-canel" id="Loading-Canel">
                <img src="../assets/loading.gif">
            </div>
            <div class="side-container">
                <div class="box-container-a">
                    <service-box v-for="(service,index) in service_show_list" :service-info="service" ></service-box><!--:class="{highLight: highLightIndex}" :style="{'border':border}"-->
                </div>
                <div class="card-pagination">
                    <input type="button" value="ToPre" class="pre" :class=" {'is-disabled' : currentPage === 1 }"
                           @click="updatePageList('prev')">
                    <span>{{currentPage}} / {{totalPage}}</span>
                    <input type="button" value="ToNext" class="next" :class=" {'is-disabled' : currentPage === totalPage }" 
                           @click="updatePageList('next')">
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import serviceBox from './serviceBox'
import messageBus from '../bus/messageBus.js'

const LIST_MAX_LEN = 27;

export default {
    data() {
        return {
            typeName:'WMS',
            dataType: 'Service',
            serviceCount: 0,
            service_list: [],
            service_show_list: [],
            currentPage: 1,
            totalPage: 1,
            //border:'',
            open:false,
            //highLightIndex:true
            //selectWMSCount:0
        }
    },
    mounted() {
        this.initList();       
        this.updateServiceList();
        this.updateDataType();
        this.loadingShow();
        //this.setServiceBoxBorder();
    },
    /*watch:{
        selectWMSCount: function(){
            alert(this.selectWMSCount);
            this.border = '1px solid #454545'; 
        }
    },*/
    methods:{
        //显示loading的动画效果
        loadingShow:function(){
            var canel = document.getElementById('Count-Canel');
            var load = document.getElementById('Loading-Canel');
            if (this.service_list.length === 0) {              
                canel.style.display = 'none';
                load.style.display = 'block';
            }else{
                load.style.display = 'none';
                canel.style.display = 'block';
            }
        },
        //读取图层列表
        initLayerList:function(){
            this.$http.post('/api/ReturnLayerList/Return_Layer_List',{},{}).then(function(response){
                this.service_list = response.body;
                this.refreshShowList();
            })
        },
        //更新数据类型
        updateDataType:function(){
            messageBus.$on('Data Type',(type)=>{
                this.dataType = type;
                if (this.dataType === 'Service') {
                    //this.initList();
                    this.typeName = 'WMS';
                }else{
                    //this.initLayerList();
                    this.typeName = 'Layer';
                }
            }); 
        },
        //读取列表数据
        initList: function(){
            this.$http.post('/api/user/Return_WMS_list',{},{}).then(function(response){
                this.service_list = response.body;
                //console.log(this.service_list);
                this.loadingShow();
                this.refreshShowList();
            })
        },
        //翻页响应函数
        updatePageList(direction) {
            if(direction === 'prev') {
                this.currentPage -= 1;

                if(this.currentPage < 1) {
                    this.currentPage = 1;
                }
            }
            else {
                this.currentPage += 1;

                if(this.currentPage > this.totalPage) {
                    this.currentPage = this.totalPage;
                }
            }

            this.refreshShowList();

            //翻页时关上所有子节点
            this.open = false;
            messageBus.$emit('folder-open-handle',this.open);
        },
        //更新当前页面数据
        refreshShowList() {
            //页数计算
            this.totalPage = Math.ceil(this.service_list.length / LIST_MAX_LEN);

            //数据量计算 
            this.serviceCount = this.service_list.length;

            let slice_start = (this.currentPage - 1) * LIST_MAX_LEN;
            let slice_end = (this.currentPage) * LIST_MAX_LEN;

            // last page 
            if(this. currentPage === this.totalPage ) {
                this.service_show_list = this.service_list.slice(-LIST_MAX_LEN);
            }
            else {
                this.service_show_list = this.service_list.slice(slice_start, slice_end);
            } 

            let load_page = (this.service_list.length / LIST_MAX_LEN);
        },
        //更新列表
        updateServiceList: function(){
            messageBus.$on('service-list-data-search',(service_list_update) => {
                //console.log(service_list_update);
                if (service_list_update === 'reset') {
                    if (this.dataType === 'Service') {
                        this.initList();
                    }else{
                        this.initLayerList();
                    }
                }else{
                    this.service_list = service_list_update;
                    this.refreshShowList();
                }
            })
        }
        //配合每一条数据的边框展示
        //setServiceBoxBorder: function(){
        //    messageBus.$on('select-service-count',(count) =>{
        //        this.highLightIndex = this.highLightIndex ? false: true; 
        //        this.
        //    });
        //}
    },
    components: {
        serviceBox,
    }
}
</script>

<style>
/*.highLight{
    border: 1px solid red;
}*/
.right-sideBar{
    position: absolute;
}
.Count-canel{
    position: absolute;
    top: 0.5%;
    right: 0;
    height: 4.5%;
    width: 15%;
}
.Count-canel span{
    font-size: 25px;
    color:#0066ff;
}
.Count-canel p{
    font-size: 15px;
}
.Load-canel{
    position: absolute;
    top: 0.5%;
    right: 0;
    height: 4.5%;
    width: 15%;
}
.Load-canel img{
    margin-top: 5px;
    margin-left: 20px;
    width: 30px;
}
.side-container {
    position: absolute;
    top:5.5%;
    right: 0;
    width: 15%;
    height:94%;
    background-color: #1c1c1c;
    z-index: 2;
}
.box-container-a{
    margin-top: 0px;
    height: 95%;
    overflow-y: scroll;
}
.card-pagination{
    top: 95%;
    color: #000;
    height: 5%;
    width: 100%;
    display: flex;
}
input{
    font-size: 15px;
    margin-top: 4%;  
    border-radius: 2px;
    border-width: 0px;
    height: 25px;
    background-color: #454545;
    text-align: center;
}
.pre{
    margin-left: 1%;
}
.next{
    background-color: #0066ff;
}
span{
    margin-left: 2%;
    width: 57%;
    text-align: center;
    margin-top: 4%;
    color:#696969;
}
::-webkit-scrollbar{
    width: 6px;
}
::-webkit-scrollbar-track  
{  
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);  
    border-radius: 10px;  
    background-color: #1C1C1C;  
} 
::-webkit-scrollbar-thumb  
{  
    border-radius: 10px;  
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);  
    background-color: #555;  
} 
</style>
