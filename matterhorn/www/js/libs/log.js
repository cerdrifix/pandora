/**
 *		Log Library
 *		@author		Davide Ceretto
 *		@date 		Jan 08 2014
 *		@package 	libs
 *		@class		log
 **/

 __DEBUG__ = true;

(function($) {

    "object" !== typeof mds && (mds = {});
    "object" !== typeof mds.libs && (mds.libs = {});
	"object" !== typeof __libs && (__libs = mds.libs);
	var _self = mds.libs.log = mds.libs.log || {};

	/**
	 *	@method 		log
	 *	@parameters 	( String text, HtmlElement element )
	 *	@description	Used to log some text into element and (if available) into debug console
	 */
	mds.libs.log.print = function(p) {
		// if(!__DEBUG__)
		// 	return;

		// if(!$.isArray(objects)) objects = [objects];
		// if(!!element) {
		// 	element = typeof(element) == "string" ? 
		// 		element.substr(0,1) == "#" ? 
		// 			$(element)
		// 		: 	$("#"+element)
		// 	: 	$(element);
		// 	for(var i = 0; i < objects.length; i++) {
		// 		element.html(element.html() + '<br/>' + _self.po(objects[i]) + '<br/>');
		// 	}
		// }
		
		// _self.consoleLog(objects, element);

    	if (!console) console = {log: function() {}};
    	console.log(p);
	};

	// mds.libs.log.consoleLog = function(objects, elements) {
	//     if (typeof console !== "undefined" && typeof console.log !== "undefined" ) { typeof console.log.apply !== "undefined" && console.log.apply(console, objects); }
	//     else { !!elements && alert(objects); }
	// };

	// mds.libs.log.po = function(object) {
	// 	var output = '';

 //        "string" !== typeof object && (output += "{<br/>");
		

	// 	if(typeof(object) == "function")
	// 		return;

	// 	if(typeof(object) == "string") {
	// 		output += object;
	// 	}
	// 	else {
	// 		for(prop in object) {
	// 			if(typeof(object[prop]) == "function") continue; 
	// 			if(typeof(object[prop]) == "object") {
	// 				_self.po(object[prop]);
	// 			}
	// 			output += prop + ': ' + object[prop] + ';<br/>';
	// 		}
	// 	}
		
	// 	"string" !== typeof object && (output += "}");
	// 	return output;
	// };

})(jQuery);