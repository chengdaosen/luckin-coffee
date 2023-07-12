var mysql = require('mysql')


var connection = mysql.createConnection({
	//主机名
	host: "localhost",
	//设置端口号
	port: '3306',
	//设置用户名
	user: "root",
	//密码
	password: '123456',
	//找到操作的表
	database: 'luckin'
})

connection.connect();
module.exports = connection