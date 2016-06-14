var Config		= require('./Config');

exports.init = function(serviceName) {
	var connector	= Config.db.getConnectionForService(serviceName),
		dbengine 	= require('./'+connector.type+'Connector');

	return new dbengine(connector.connection);
}