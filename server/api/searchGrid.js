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

// 点击单元格搜索单元格信息
router.post('/SearchGrid', (req, res) => {
    //var sql = $sql.user.searchWMSByKeyword;
    var params = req.body;
    var sql = "SELECT * FROM "+params.table+" WHERE id='"+params.id+"';";     
    conn.query(sql, [params.id,params.table],function(err, result) {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    })
});


module.exports = router;