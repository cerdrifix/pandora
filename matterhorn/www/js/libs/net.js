/**
 *		Net Library
 *		@author		Davide Ceretto
 *		@date 		Jan 08 2014
 *		@package 	libs
 *		@class 		net
 *
 **/

 (function($) {

 	"object" !== typeof mds && (mds = {});
    "object" !== typeof mds.libs && (mds.libs = {});
    "object" !== typeof mds.libs.net && (mds.libs.net = {});
    "object" !== typeof mds.libs.net.fn && (mds.libs.net.fn = {});
	var _self = mds.libs.net || {};

	/**
	 	@package		mds.libs.net
	 	@method			sendPostRequest(url, args, callback)
		@parameters		url:string
						args:object
						callback:function (optional)
		@description	sendPostRequest is used to send asynchronous POST requests.
	 **/
    mds.libs.net.sendPostRequest = function(url, args, callback) {
    	mds.libs.log.print(url);
    	$.ajax({
	        type: 'POST',
	        async: true,
	        contentType: "application/json; charset=UTF-8",
	        url: url,
	        data: !!args ? JSON.stringify(args) : null,
	        dataType: 'json',
			success: function(data, textStatus, jqXHR) {

				_r = mds.libs.net.fn.parseDatesInResult(data);
				
				if(!!callback)
		    		callback(_r);
			},
			error: mds.libs.net.fn.error
		});
    };


	/**
	 	@package		mds.libs.net
	 	@method			sendSyncPostRequest(url, args, callback)
		@parameters		url:string
						args:object
						callback:function (optional)
		@description	sendSyncPostRequest is used to send synchronous POST requests.
	 **/
    mds.libs.net.sendSyncPostRequest = function(url, args, callback) {
    	var exitCond = 0,
    		message = "",
			_r = null,
    		_ct = "application/json; charset=UTF-8";

    	mds.libs.log.print("\n\nnet args: ", args);

		for (i=0;i<3;i++)
		{
			$.ajax({
				type: 'POST',
				async: false,
				contentType: _ct,
				url: url,
				data: !!args ? JSON.stringify(args) : null,
				dataType: 'json',
				// crossDomain: true,
				//processData: false,
				success: function(data, textStatus, jqXHR) {
					_r = mds.libs.net.fn.parseDatesInResult(data);
					if(!!callback)
						callback(_r);
				},
				error: function( jqXHR, textStatus, errorThrown ) {
				
					mds.libs.net.fn.error( jqXHR, textStatus, errorThrown );
					message = jqXHR.responseText;
					if (message.indexOf("denied") <= 0) {
						exitCond = 1;
					}
				}
			});
			
			if ((_r != null) || (exitCond == 1))
			{
				return _r;
			}
			else
			{
				mds.libs.log.print("error loop #" + i );
			}
		}
		!!callback && callback(_r);
		return _r;
    };

    /**
	 	@package		mds.libs.net.fn
	 	@method			success(data, textStatus, jqXHR)
		@parameters		data:object
						textStatus:string
						jqXHR:object
		@description	success is called from net requests for success callbacks
	 **/
    mds.libs.net.fn.success = function(data, textStatus, jqXHR) {
    	return
    };

	/**
	 	@package		mds.libs.net.fn
	 	@method			error(data, textStatus, jqXHR)
		@parameters		data:object
						textStatus:string
						jqXHR:object
		@description	error is called from net requests for error callbacks
	 **/
    mds.libs.net.fn.error = function( jqXHR, textStatus, errorThrown ) {
		__mds.libs.log.print([String.format("{0}: ", jqXHR.statusText), jqXHR]);
		message = jqXHR.responseText;
		showMessage(jqXHR.statusText,"error");
	};


	/**
	 	@package		mds.libs.net.fn
	 	@method			parseDatesInResult(result)
		@parameters		reult:object
		@description	parses Dates string to Date Objects in results
	 **/
    mds.libs.net.fn.parseDatesInResult = function( result ) {
    	for(var i = 0; i < result.length; i++) {
    		for(var prop in result[i]) {
    			var m = result[i][prop];
    			if(!!m && "string" === typeof m && m.indexOf("/Date") >= 0) {
    				result[i][prop] = m.parseMSJSONDate();
    			}
    		}
    	}
    	return result;
	};

})(jQuery);