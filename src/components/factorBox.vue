<template>
<div class="boxContainer">
    <div class="factorbox">
        <a>{{parentInfo.factor}}</a>
        <a @click="openFolder" class="folder">{{open ? '<<<': '>>>'}}</a>
    </div>
    <div v-show="open" class="child-box">
        <div v-for="child,index in parentInfo.children" class="child" :style="{'background-color':child.factorBgc}" >
            <a @click="selectFactor(index)">{{child.name}}</a>
            <i class="fa fa-times icon-close" @click="resetSelectFactor(index)" v-show="child.factorSelectClose"></i>
        </div> 
    </div>
</div>
</template>

<script>

import messageBus from '../bus/messageBus.js'

export default {
	data() {
        return {
        	open:true,
            factorIndex: null,
            factorCount_temp:null,
            Publisher: '',
            CRS: '',
            dataType:'',
            Topic:'',
            dataTypeChangeValue:''
        }
    },
    props:['parentInfo'],
    mounted(){
        if (this.parentInfo.factor === 'Data Type') {
            this.initDataType();
        }
        messageBus.$on('data-type-change',(factor)=>{
            
        });
    },
    watch:{
        dataTypeChangeValue:function(){
            if (this.parentInfo.factor==='Data Type') {
                this.initDataType();
                this.parentInfo.children[1].factorBgc = '#1C1C1C'; 
                this.parentInfo.children[1].factorSelectClose = false;
            }
        }
    },
	methods:{
        //回传具体视图下的dataTyoe改变
        loadDataTypeChange:function(){
            messageBus.$on('data-type-change',(factor)=>{
                this.dataTypeChangeValue = factor;
            });
        },
        //初始化数据类型为Service
        initDataType:function(){
            this.parentInfo.children[0].factorBgc = '#000'; 
            this.parentInfo.children[0].factorSelectClose = true;
        },
        //展开搜索条件列表中的>>>以显示搜索条件
        openFolder(){
            this.open = this.open ? false: true;
        },
        //将搜索条件传递给mainSearch.vue进行搜索查询接口
        DefineFactor(factor,index){
            this.SetFactorBgcCloseBtn(factor,this.parentInfo.children);
            messageBus.$emit(factor,this.parentInfo.children[index].name);
        },
        //选择搜索条件
        selectFactor:function(index){
            messageBus.$emit('folder-open-handle',false);
            //定义搜索条件选中背景变色，否则恢复原色          
            this.factorIndex = index; 
            //将搜索条件传递给mainSearch.vue进行搜索查询接口
            this.DefineFactor(this.parentInfo.factor,index);            
            this.parentInfo.children[index].factorBgc = '#000';
            this.parentInfo.children[index].factorSelectClose=this.parentInfo.children[index].factorSelectClose ? false:true;
            //返回搜索条件个数，到leafSider中
            var par = 1;
            messageBus.$emit('factorCount-update',par);
        },
        //取消搜索条件选择，背景恢复原色，并改变搜索条件个数
        resetSelectFactor:function(index){
            messageBus.$emit('folder-open-handle',false);
            this.parentInfo.children[index].factorBgc = '#1C1C1C';  
            this.parentInfo.children[index].factorSelectClose=this.parentInfo.children[index].factorSelectClose ? false:true;
            this.factorCount_temp -= 1;
              
            if (this.parentInfo.factor==='Data Type') {
                this.initDataType();
                messageBus.$emit('Data Type','Service');
            }else{
                var par = -1;
                messageBus.$emit('factorCount-update',par);
                messageBus.$emit(this.parentInfo.factor,'');   
            }
        },
        SetFactorBgcCloseBtn: function(factorType,child){
            for (var i = 0; i <child.length; i++) {
                child[i].factorBgc = '#1C1C1C'; 
                child[i].factorSelectClose = false;   
            }            
        }
    }
}
</script>

<style>
.boxContainer{
    height: auto;
}
.factorbox {
    margin-left: 1%;
    right: 1%;
    height: 24.7px;
    margin-bottom: 2%;
    border-radius:2px;
    background-color: #454545;    
}
.factorbox a{
    font-size: 12px;
    color: #000;
    margin-top: 3px;
    margin-left:3%;
    display: inline;

}
.folder{
    font-size: 12px;
    float: right;
    display: inline;
    margin-right: 4px;
}
.child-box{
    height: auto;
    width: 98%;
    right: 1%;
    margin-left: 1%;
    background-color: #1C1C1C;
    margin-bottom: 4%;
}
.child{
    height: 16px;
    margin-bottom: 2px;
    z-index: 3;
    display: flex;
}
.topic_icon{
    margin-left: 5px;
    width: 10px;
    height: 10px;
    background-color: #ff0000;
}
.child a{
    font-size: 12px;
    color:#696969;
    font-weight: bold;
    margin-top: 0px;
    margin-left: 5px;
}
#child i.icon-close {
    margin-left: 95%;
    color: #69707a;
    cursor: pointer;
    pointer-events: auto;
}
</style>
