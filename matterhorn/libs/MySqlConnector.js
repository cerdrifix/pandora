var mysql		= require('mysql');
var conn 		= require('./GenericConnector');

module.exports = mysqlconnector;

function mysqlconnector(connection) {
	var _parent = this;
	this.connInfo = connection;
	this.entities = {
		parent: _parent,
		list: function(entity, filters, order, callback) {
			conn.entities.list(this.parent.initConnection(), entity, filters, order, callback);
		}
	};
};

mysqlconnector.prototype = {
	initConnection: function() {
		return mysql.createConnection(this.connInfo);
	},
	runProcedure: function(procedureName, parameters, callback) {
		var q = "call " + procedureName + "(";
		
		for(i = 0; i<parameters.length; i++) { q += "?,"; }
		
		if(q.indexOf(",") > -1)
			q = q.substr(0,q.length-1);

		q += ");";

		conn.executeQuery(this.initConnection(), q, parameters, callback);
	}
};