var http 		= require('http');
var express		= require('express');
var Config		= require('./libs/Config');
var Connector	= require('./libs/DbConnector');
var auth		= require('./libs/Auth');

var mainDbEngine = Connector.init("main");

var app = express();
app.use(express.bodyParser());

app.use("/css", express.static(__dirname + '/www/css'));
app.use("/js", express.static(__dirname + '/www/js'));

app.get("/", function(req, res) {
	res.sendfile('www/login.html');
});

app.get("/encrypt", function(req, res) {
	res.writeHead(200, {'Content-Type': 'text/html'});

	auth.encrypt("pass", function(data) {
		res.write(data);
		res.write("<br/>length: " + data.length);
		res.end();
	});
});

app.get("/sp", function(req, res) {
	res.writeHead(200, {'Content-Type': 'application/json'});

	mainDbEngine.runProcedure('sp_anag_getUserPermissions', ['CREDL18'], function(data) {
		res.write(JSON.stringify(data));
		res.end();
	});
	
});
app.get("/entity", function(req, res) {
	res.writeHead(200, {'Content-Type': 'application/json'});

	mainDbEngine.entities.list('users', function(data) {
		res.write(JSON.stringify(data));
		res.end();
	});
})

app.post("/login", function(req, res) {
	res.writeHead(200, {'Content-Type': 'text/plain'});

	auth.login(req.body.username, req.body.password, function(data) {
		res.write(JSON.stringify(data));
		res.end();
	});
});

app.listen(1337);
console.log('Server running at \nhttp://127.0.0.1:1337/');