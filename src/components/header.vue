<template>
  <header class="main-header">
  	<img class="main-logo" src="../assets/logo2.png" alt="logo">
  	<div class="navigation">
  		<a v-for="view,index in viewList" @click="ViewSelect(index)" :style="{'color':view.changecolor? '#0066ff':'#696969'}">{{view.name}}</a>
  	</div>
  </header>
</template>

<script>

import messageBus from '../bus/messageBus.js'

export default {
  data() {
        return {
          viewList:[
          {name:'Grid View',changecolor:false},
          {name:'Country View',changecolor:false},
          {name:'Continent View',changecolor:false},
          {name:'WMS View',changecolor:false}]
        }
    },
    mounted(){
      this.viewList[3].changecolor=true;
      this.ViewChange();
    },
    methods:{
      //选择视图后变色，并将视图选项传递给map.vue以供加载图层
      ViewSelect: function(index){
          messageBus.$emit('view-update',this.viewList[index].name);
          if (this.viewList[index].changecolor === false) {
            this.viewList[index].changecolor=this.viewList[index].changecolor?false:true;
            for (var i = 0; i < this.viewList.length; i++) {
              if (i != index) {
                this.viewList[i].changecolor = this.viewList[index].changecolor?false:true;
              }
            }
          }
      },
      ViewChange:function(){
        messageBus.$on('view-change',(view) =>{
          for (var i = 0; i < this.viewList.length; i++) {
            if (view === this.viewList[i].name) {
              this.viewList[i].changecolor = true;
            }else{
              this.viewList[i].changecolor = false;
            }
          }
        });
      }

    }
}
</script>

<style>
.main-header {
    position: absolute;
    height: 4.5%;
    width: 100%;
    background-color: #000;
    display: flex;
}

.main-logo{
	height: 98%;
}

.navigation {
	position: absolute;
	display: flex;
	flex:row wrap;
	right: 0.5%;
	bottom:10%;
}
.navigation a{
	margin-left: 20px;
	color: #696969;
}
.navigation a:hover {color:#0066ff}          
</style>
