首先介绍几句要谈论的这个全栈项目的背景。网站集合了搜索和地图可视化两个主要功能模块，两个功能之间彼此配合更新。

搜索功能模块，设置了三种搜索条件，对两种类型的数据进行搜索，根据前端搜索条件的选择，传递参数利用Express调取MySQL中存储的数据，进行搜索结果的更新。

搜索结果，采用树形的分页组件展示，树形节点及其子节点都可以点击在地图上查看单个数据的地理位置(地图打点)和详细信息(popup)，节点展开后的子节点也可以在地图上叠加展示样式和详细信息。

在搜索结果返回后，除了对树形列表进行更新之外，地图上采用散点图进行实时可视化，也设置了三种视图分别叠加在GeoServer中生成的图层来进行地图可视化

项目地址：[vue-mysql-leaflet-geoserver](https://github.com/zhangmingemma/vue-mysql-leaflet-geoserver)

将数据导入MySQL数据库，数据库配置在项目目录下server/db.js中配置，demo数据在static/data/sql中

利用GeoServer发布WMS，demo数据在static/data/geoserver中，[GeoServer配置及发布WMS的教程在这里](https://zhangmingemma.github.io/2017/08/geoserver-install/)

安装依赖包

```
cnpm install
```

进入主目录的server目录下运行nodemon，监测数据查询

```
nodemon index
```

运行项目

```
npm run dev
```

具体教程：

Vue项目初始搭建：[Vue + Leaflet + Express 全栈项目(一)：Vue项目初始化](https://zhangmingemma.github.io/2017/09/Vue-Project1/)
Vue与MySQL：[Vue + Leaflet + Express 全栈项目(二): Vue-Express-MySQL](https://zhangmingemma.github.io/2017/09/Vue-Project2/)
Vue中使用树形分页列表：[Vue + Leaflet + Express 全栈项目(三):Vue_树形列表](https://zhangmingemma.github.io/2017/11/Vue-Project3/)
Vue中使用Leaflet：[Vue + Leaflet + Express 全栈项目(四):Vue-Leaflet](https://zhangmingemma.github.io/2017/11/Vue-Project4/)