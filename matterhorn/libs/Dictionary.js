var fs		= require('fs');

exports.getString = function(code, lan, type) {
	
	switch(type) {
		case "error":
		default: {
			var dic = JSON.parse(fs.readFileSync("res/errors.lang", "utf8"));

			try {
				return dic[code][lan];	
			}
			catch(err) {
				return dic["default"][lan]+" with code: "+code;
			}
		}
		break;
	}

};