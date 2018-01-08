<template>
  <div id="app" class="wrap">
	<my-head></my-head>
	<my-content></my-content>
  </div>
</template>

<script>
import myHead from './components/header';
import myContent from './components/content'
export default {
  name: 'app',
  components: {
  	myHead,
  	myContent
  }
}
</script>

<style>
.wrap{
	width: 100%;
	height: 100%;
}
</style>
