var express = require('express');
var router = express.Router();
//引入mysql
var sql = require('../config/mysql.js')
/* GET home page. */
router.get('/', function(req, res, next) {
	sql.query('select * from detail where detail.xqname=?', [req.query.detailName], function(err, data) {
		res.send(data)
	})
});
router.post('/', function(req, res, next) {
	sql.query('select * from car where car.name=?', [req.body.name], function(err, data) {
		if (data.length == 0) {
			sql.query('insert into car(src,pic,name,num) value(?,?,?,?)', [req.body.src, req.body
					.pic, req.body.name, req.body.num
				],
				function(err, data) {
					res.send(data)
				})
		} else {
			console.log('更新购物车：', data)
			let num = data[0].num + req.body.num
			console.log(num)
			console.log(req.body.name);
			sql.query('update car set car.num=? where car.name=?', [num, req.body.name],
				function(err, data) {
					res.send(data)
				})
		}
	})
})
module.exports = router;

// if (data.length == 0) {
// 		sql.query('insert into car(src,pic,name,num)value(?,?,?,?)', [req.body.src], [req.body.pic],
// 			[req.body.name], [req.body.num],
// 			function(err, data) {})
// 	} else {
// 		sql.query('update car set car.num=?where car.name=?', [req.body.num, req.body.name],
// 			function(err, data) {}
// 		}
// 	}
// });