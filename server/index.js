// node 后端服务器
const userApi = require('./api/userApi');
const searchLayer = require('./api/searchLayerByWMSId');
const searchWMSByFactor = require('./api/searchWMSByFactor');
const searchGrid = require('./api/searchGrid');
const ReturnLayerList = require('./api/ReturnLayerList');
const searchWMSByLayerId = require('./api/searchWMSByLayerId');
const searchLayerByFactor = require('./api/searchLayerByFactor');
const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');
const express = require('express');
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

// 后端api路由
app.use('/api/user', userApi);
app.use('/api/searchLayer', searchLayer);
app.use('/api/searchWMSByFactor',searchWMSByFactor);
app.use('/api/searchGrid',searchGrid);
app.use('/api/ReturnLayerList',ReturnLayerList);
app.use('/api/searchWMSByLayerId',searchWMSByLayerId);
app.use('/api/searchLayerByFactor',searchLayerByFactor);
// 监听端口
app.listen(3000);
console.log('success listen at port:3000......');