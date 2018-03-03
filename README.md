## 项目使用技术

这是一个Web前端小型全栈项目，项目使用了如下主要工具：

* Vue：前端主题框架

* Express：发布后台服务，实现前端与数据库之间的数据传输与数据查询

* GeoServer：发布地图服务，为大规模地理空间数据的可视化做准备

* LeafLet：实现地图交互与地图数据可视化

* MySQL: 数据存储

## 项目背景与功能模块

项目的目标是为了搭建一个可视化门户网站，实现网络地图服务的搜索与地图可视化。主要功能模块：

* 搜索功能：设置了三种搜索条件，对两种类型的数据（网络地图服务与地图图层）进行搜索，根据搜索条件的选择，连接数据查询接口进行数据查询。

* 搜索结果列表展示与交互：搜索结果，采用树形的分页组件展示，树形父节点可以点击，在地图上查看单个数据的地理位置(地图打点)和详细信息(popup），子节点也可以在地图上叠加展示样式和详细信息。父节点与子节点间存在对应的关联映射，选择不同的数据主体类型，父子节点会有对应的关联映射。

* 地图可视化更新：在搜索结果返回后，地图对应实时更新重绘格网图、散点图或地理空间统计图

## 项目效果展示

![](/screenShot1.png)
![](/screenShot2.png)

录屏播放见项目地址首目录下的动画效果1 & 2

## 项目配置与使用

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

Vue项目初始搭建：[Vue + Leaflet + Express 全栈项目(一)：Vue项目初始化](https://zhangmingemma.github.io/2017/09/Vue-Project1/)<br/>
Vue与MySQL：[Vue + Leaflet + Express 全栈项目(二): Vue-Express-MySQL](https://zhangmingemma.github.io/2017/09/Vue-Project2/)<br/>
Vue中使用树形分页列表：[Vue + Leaflet + Express 全栈项目(三):Vue_树形列表](https://zhangmingemma.github.io/2017/11/Vue-Project3/)<br/>
Vue中使用Leaflet：[Vue + Leaflet + Express 全栈项目(四):Vue-Leaflet](https://zhangmingemma.github.io/2017/11/Vue-Project4/)