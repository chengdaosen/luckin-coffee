var express = require('express');
var router = express.Router();
var sql = require('../config/mysql.js')

/* GET home page. */
router.get('/', function(req, res, next) {
	console.log(req.query)
	sql.query('select * from login where login.username=?', [req.query.userName], function(err, data) {
		if (data.length) {
			if (data[0].password == req.query.password) {
				res.send('1')
			} else {
				res.send('2')
			}
		} else {
			res.send('3')
		}
	})
});
router.post('/', function(req, res, next) {
	console.log('我的里面发请求', req.body);
	sql.query('select * from login where login.username=?', [req.body.username], function(err, data) {
		res.send(data)
	})
});
module.exports = router;