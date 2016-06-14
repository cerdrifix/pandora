var dic		= require('./Dictionary');
var logger	= require('./Logger');

var _executeQuery = function(connection, query, parameters, callback) {

	if(typeof parameters === "function") {
		callback = parameters;
		parameters = [];
	}

	var _handler = function(err, result) {

		var rVal = {};

		if(err) {
			rVal.status = "ko";
			rVal.error = err;
			logger.error(dic.getString(err.code, "it", "error"));
		}
		else {
			rVal.status = "ok";

			console.log("result: ", result);

			result = result[0];

			console.log("result: ", result);

			rVal.data = (result.length > 0 && result[0] instanceof Array) ? result[0] : result;
		}

		if(!!callback) 
			callback(rVal);

		connection.end();
	};

	var query = connection.query(query, parameters, _handler);	

	logger.info("executing query: ", query.sql);
	
};
exports.executeQuery = _executeQuery;

exports.createFilterString = function(filters) {
	var str = "";

	for(var i=0; i<filters.length; i++) {
		var item = filters[i];
		if(item instanceof Array) {
			str = str + "( " + this.createFilterString(item) + " )";
		}
		else {
			str = str + " " + item.field + " " + item.condition + " ";
		}

		str = str + item.aggregation;
	}
};

exports.entities = {
	list: function(connection, entity, filters, order, callback) {
	
		if(typeof filters === "function") callback = filters;
		if(typeof order === "function") callback = order;

		if(!entity) {
			callback({ status: "ko", error: dic.getString("error", "it", "error") })
		}

		var q = "select * from " + entity;

		_executeQuery(connection, q, callback);

	}
};