var express = require('express');
var router = express.Router();
var sql = require('../config/mysql.js')

/* GET home page. */
router.get('/', function(req, res, next) {
	console.log(req.query)
	sql.query('select * from login where login.username=?', [req.query.userName], function(err, data) {
		if (data.length) {
			res.send('2')
		} else {
			sql.query('insert into login(username,password) value(?,?)', [req.query.userName, req.query
					.password
				],
				function(err, data) {
					res.send('1')
				})
		}
	})
});

module.exports = router;