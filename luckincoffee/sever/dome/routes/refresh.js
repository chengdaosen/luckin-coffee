var express = require('express');
var router = express.Router();
//引入mysql
var sql = require('../config/mysql.js')
/* GET home page. */
router.post('/', function(req, res, next) {
	if (req.body.type == "人气TOP") {
		sql.query('select * from hot', function(err, data) {
			res.send(data)
		})
	} else {
		sql.query('select * from hot where hot.type=?', [req.body.type], function(err, data) {
			res.send(data)
		})
	}

});

module.exports = router;