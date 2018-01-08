// sql语句
var sqlMap = {
    // 用户
    user: {
        select:'SELECT * from wms_topic;',
        searchLayer:'SELECT * from Layer_topic_keyword where service_id=?',
        selectLayer: 'SELECT * from Layer_topic_keyword_copy;',
        searchWMSByLayerId:'SELECT * from wms_topic inner join Layer_topic_keyword_copy on wms_topic.id=Layer_topic_keyword_copy.service_id where Layer_topic_keyword_copy.id=?;'
    }
}

module.exports = sqlMap;