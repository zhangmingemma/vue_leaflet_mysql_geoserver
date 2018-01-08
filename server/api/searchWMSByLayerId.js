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

// 通过给定的Layer ID搜索WMS
router.post('/Search_WMS_By_LayerID', (req, res) => {
    var sql = $sql.user.searchWMSByLayerId;
    var params = req.body;
    console.log(params);
    conn.query(sql, [params.layerId],function(err, result) {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    })
});


module.exports = router;