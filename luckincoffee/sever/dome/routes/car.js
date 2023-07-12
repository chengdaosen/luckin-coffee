var express = require('express');
var router = express.Router();
//引入mysql
var sql = require('../config/mysql.js')
/* GET home page. */
router.get('/', function(req, res, next) {
	sql.query('select * from car', function(err, data) {
		res.send(data)
	})
});
router.post('/', function(req, res, next) {
	if (req.body.splist.spnum > 0) {
		sql.query('update car set car.num=? where car.name=?', [req.body.splist.spnum, req.body.splist.spname],
			function(err, data) {
				res.send(data)
			})
	} else {
		sql.query('delete from car where car.name=?', [req.body.splist.spname], function(
			err, data) {
			sql.query('select * from car', function(err, data) {
				res.send(data)
			})
		})
	}
});

module.exports = router;