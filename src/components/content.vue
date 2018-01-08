<template>
  <div class="content-container">
    <left-sider></left-sider>
    <map-container></map-container>
    <side-container></side-container>
  </div>
</template>

<script>
import leftSider from './leftSider'
import mapContainer from './map'
import sideContainer from './RightsideBar'

export default {
	components: {
		mapContainer,
    sideContainer,
    leftSider
	}
}
</script>

<style>
.content-container {
  margin:0;
  padding: 0;
  top:4.5%;
  height: 95.5%;
  position: absolute;
  width: 100%;
  background-color: #1C1C1C;
}
</style>
