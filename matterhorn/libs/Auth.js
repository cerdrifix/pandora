var Connector	= require('./DbConnector');
var crypto		= require('crypto'),
    hash        = function (pass, salt) {

        var h = crypto.createHash('sha512');

        h.update(pass);
        h.update(salt);

        return h.digest('base64');

    };

var authDbEngine = Connector.init("auth");

exports.login = function(username, password, callback) {

	var encryptedPassword = SHA256Encrypt(password, "ASIN", 3);

	console.log("password: ", password, "\nencryptedPassword: ", encryptedPassword);

	authDbEngine.runProcedure('sp_login', [username, encryptedPassword], callback);
};

exports.encrypt = function(p, callback) {
  var encryptedPassword = SHA256Encrypt(p, "ASIN", 3);

    if(!!callback)
        callback(encryptedPassword);

    return encryptedPassword;
}

function SHA256Encrypt(password, salt, iteration) {
    var saltedpassword = salt + password;
    for(var i = 0; i < iteration-1; i++) {
        var sha256 = crypto.createHash('sha256');
        sha256.update(saltedpassword);
        var saltedpassword = sha256.digest('hex');
    }
    var sha256 = crypto.createHash('sha256');
    sha256.update(saltedpassword);
    return sha256.digest('base64');
}