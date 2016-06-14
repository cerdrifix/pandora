var fs 		= require('fs');
var logger	= require('./Logger');

module.exports = Config;

function Config(options) {
//	EventEmitter.call(this);
}

Config.read = function(file) {
	if(!this.config) {
		this.config = JSON.parse(fs.readFileSync(file || "app.conf", "utf8"));
	}
	
	return this.config;
}

Config.db = {};

Config.db.getConnectionForService = function(serviceName) {
	
	if(!serviceName) {
		throw "Error in getConnectionForService!";
		return;
	}

	var conf 		= Config.read(),
		connection 	= conf.services.filter(function(s){ return s.name == serviceName });

	if(!connection.length){
		logger.error("Errore. Nessuna connessione trovata");
		throw "Errore. Nessuna connessione trovata";
	}

	var a = conf.connections.filter(function(item) {
		return item.name == connection[0].connection;
	});
	
	if(a.length) {
		return a[0];
	}
}