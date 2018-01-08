var models = require('../db');
var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var $sql = require('../sqlMap');

// 连接数据库
var conn = mysql.createConnection(models.mysql);

conn.connect();
var jsonWrite = function(res, ret) {
    if(typeof ret === 'undefined') {
        res.json({
            code: '1',
            msg: '操作失败'
        });
    } else {
        res.json(ret);
    }
};

// 通过既定的搜索条件搜索WMS
router.post('/Search_WMS', (req, res) => {
    //var sql = $sql.user.searchWMSByKeyword;
    var factorCount =0;
    var params = req.body;
    var sql = "SELECT * FROM wms_topic";    
    if (params.topic == '' && params.keyword=='' && params.publisher == '' && params.crs == '' && params.box == '') {
        sql = sql;
    }else{
        sql += " WHERE ";
    } 
    if (params.keyword != '') {
        sql += "(Title LIKE '%"+params.keyword+"%' or Abstract LIKE '%"+params.keyword+"%' or Keywords LIKE '%"+params.keyword+"%' or url LIKE '%"+params.keyword+"%')"
        factorCount+=1;
    }
    if (params.publisher != '') {
        if (factorCount>0) {
            sql+="and";
        }
        sql += "(url LIKE '%"+params.publisher+"%')";
        factorCount+=1;
    }
    if (params.topic != '') {
        if (factorCount > 0) {
            sql+="and";
        }
        sql += "(Topic LIKE '%"+params.topic+"%')";
        factorCount+=1;
    }   
    if (params.crs != '') {
        if (factorCount > 0) {
            sql+="and";
        }
        sql += "(crs LIKE '%"+params.crs+"%')";
        factorCount+=1;
    }
    if (params.box!='') {
        var a = params.box[0];
        var b = params.box[1];
        var c = params.box[2];
        var d = params.box[3];
        if (factorCount>0) {
            sql+="and";
        }
        sql+="(Latitude > "+a+") and(Latitude <"+b+" ) and (Longitude >"+c+") and (Longitude <"+d+")"
    }
    conn.query(sql, [params.keyword,params.topic,params.publisher,params.crs,params.box],function(err, result) {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    })
});


module.exports = router;