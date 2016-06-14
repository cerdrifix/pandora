var http 		= require('http');
var	mysql 		= require('mysql');
var Config		= require('./libs/Config');
// var connector	= require('./libs/mysqlconnector');
// 
// var	conn = mysql.createConnection({
// 		user: 'mha', 
// 		database: 'matterhorn_0_1', 
// 		host:'localhost',
// 		port: '8889',
// 		password: '$mha$'
// 	});
// 	

var connectorname = Config.db.getConnection();

console.log( "connector name: ", connectorname);
	
http.createServer(function (req, res) {
	res.writeHead(200, {'Content-Type': 'application/json'});
	
	var q = "call sp_anag_getUserPermissions(?);",
		p = ['CREDL18'];
	
	conn.query(q, p, function(err, result) {
		if(err) {
			console.log("errore: ", err);
			return;
		}
		res.write('parsing rows...');
		console.log(result[0]);
	});
			
	res.end();
}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');