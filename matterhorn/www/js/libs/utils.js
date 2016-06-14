
(function($) {

	if("undefined" === typeof Array.prototype.filter) {
		Array.prototype.filter = function(fun /*, thisp */)
		{
			"use strict";

			if (this == null)
				throw new TypeError();

			var t = Object(this);
			var len = t.length >>> 0;
			if (typeof fun != "function")
				throw new TypeError();

			var res = [];
			var thisp = arguments[1];
			for (var i = 0; i < len; i++) {
				if (i in t) {
					var val = t[i]; // in case fun mutates this
					if (fun.call(thisp, val, i, t))
						res.push(val);
				}
			}

			return res;
		};
	}

	if("undefined" === typeof openDialog) {
		openDialog = function(dialogId) {
            $("#"+dialogId).dialog("open");
        };
	}

	if("undefined" === typeof clearForm) {
		clearForm = function(formId) {
            $("#"+formId).find("input, select").val("");
        };
	}

	if("undefined" === typeof closeDialog) {
		closeDialog = function(dialogId) {
            $("#"+dialogId).dialog("close");
        };
	}

	if("undefined" === typeof String.format) {
		String.format = function(string) {
			var args = [].slice.call(arguments,1);
			return string.replace(/{(\d+)}/g, function(match, number) { 
	          return typeof args[number] != 'undefined'
		        ? args[number]
		        : match
		      ;
		    });
		}
	}

	if("undefined" === typeof Date.prototype.toMSJSON) {
		Date.prototype.toMSJSON = function () {
			var date = '/Date(' + ( this.getTime() - ( this.getTimezoneOffset() * 60000 ) ) + ')/';
			return date;
		};
	}

	if("undefined" === typeof String.prototype.parseMSJSONDate) {
		String.prototype.parseMSJSONDate = function() {
			var re = /(.*Date\()(.*)(\).*)/;
			return new Date( parseInt( this.match(re)[2].split('+')[0] ) );
		}
	}

	if("undefined" === typeof $.fn.bindData) {
		$.fn.bindData = function(force) {
			return this.each(function(i, oo) {
				var $this = $(this),
					interface = $this.data("interface"),
					cfg = $this.data("config"),
					_this = this;

				if(!force && "undefined" !== typeof cfg.autoBind && !cfg.autoBind)
					return;

				switch(this.tagName.toLowerCase()) {
					case 'table': {
						$("#"+this.id).trigger("reloadGrid");
						break;
					}
					case "input": {

						if("undefined" !== typeof data)
							break;

						if(!!cfg && cfg.dataSource && !!cfg.autoBind) {
							var data = __libs.config.getDataSource(cfg.dataSource);
							if(data.length > 1) {
								data = data[0];
								$this.val(data);
							}
							else {
								$this.val(data);
							}
						}

						break;
					}
					case 'div':
					case 'label': {
						
						if("undefined" !== typeof data)
							break;

						if(!!cfg && cfg.dataSource && !!cfg.autoBind) {
							var data = __libs.config.getDataSource(cfg.dataSource);
							if($.isArray(data) && data.length > 1) {
								data = data[0];
								$this.html(data);
							}
							else {
								$this.html(data);
							}
						}
						break;
					}
					case 'select': {
						var	pageId = $this.data("pageId");

						$this.empty();

						if(cfg.length) cfg = cfg[0];

						if(!cfg.multiple)
							$this.append("<option />");

						var arrayData = null;

						arrayData = __libs.config.getDataSource(cfg.dataSource);


						if(!!arrayData) {
							for(var o = 0; o < arrayData.length; o++) {
								var op = $("<option />")
									.attr("value", arrayData[o][cfg["ref-field-value"]])
									.data("bindData", arrayData[o])
									.appendTo(this);
								
								var dsc_field = cfg["ref-field-description"];
								if($.isArray(dsc_field)) {
									var _sep = dsc_field[0],
										_arr = dsc_field.slice(1),
										_narr = [];
									for(var i = 0; i < _arr.length; i++) {
										_narr.push(arrayData[o][_arr[i]]);
									}
									op.html(_narr.join(_sep));
								}
								else {
									op.html(arrayData[o][dsc_field]);
								}



								if(!!cfg.defaultValue && cfg.defaultValue == arrayData[o][cfg["ref-field-value"]])
									op.attr("selected", "selected");
							}
						}

						break;
					}
					case 'form': {

						if(!!cfg.dataSource) {
							$(this).data("bindData", __libs.config.getDataSource(cfg.dataSource));
						}
                        else {
							_data = $this.data("bindData");
							if(!!_data) {
								$("input, select", this).each(function(ii, item) {
									__libs.log.log(["setting form value for id: ", item.id, _data[item.name]]);
									var $item = $(item);
									if($item.attr("data-type")=="date") {
										var _d = (_data[item.name] instanceof Date) ? _data[item.name] : (_data[item.name] != "") ? moment(_data[item.name])._d : "";
									    if(_d != "")
									    	$item.val($.datepicker.formatDate("dd/mm/yy", _d))
									}
									else {
	    								$item.val(_data[item.name]);
	    				            }
									var binder = $(this).data("binderOf");
									if(!!binder && binder.length) {
										for(var i = 0; i < binder.length; i++) {
											$(binder[i]).bindData();
										}
									}
								});	
							}
						}
						break;
					}
				}

				/* 
					Select correct value using "dataBinding" config section
				 */
				if("undefined" !== typeof $this.data("config")) {
					var _c = $this.data("config");
					var _dc = _c.dataBinding;
					var _data = null;
					/*
					if(!!_dc) {
						switch(_dc.type) {
							case "entity": {
								var filter = __libs.filter.createFilter(_dc.filters);
								var data = __libs.net.fn.sList(_dc.entity, 1, null, filter, null);
								if(!!data && data.length) {
									//console.log("called external entity: ", data[0], 'value', data[0][_dc.property]);
									_data = data;
								}
								break;
							}
							case "bind-data": {
								var d = $(String.format("#{0}_{1}", _dc["ref-page-id"], _dc["ref-id"])).data("bindData");
								//console.log("binding data on element ", this, ": ", d);
								_data = d;
								break;
							}
							case "page-data": {
								_data = $(String.format("#{0}", _dc["ref-page-id"])).data("bindData");
								if(!!_data) {
									__libs.log.log(["page data: ", _data]);
									value = _data[_dc["ref-id"]];
								}
								break;
							}
				            case "local": {
				                __libs.log.log("\n------ Binding using local data -------\n");
				                var _data = (_dc.targetElement == "page") ?
				                    $(String.format("#{0}", _dc["ref-page-id"])).data("bindData") :
				                    $(String.format("#{0}_{1}", _dc["ref-page-id"], _dc["ref-id"])).data("bindData");
				                
				                _data = !!_dc.returns && _dc.returns == "single" && !!_data && _data.length ? _data[0] : _data;

				                value = !!_data ? _data[_dc["ref-id"]] : null;

				                break;
				            }
						}
						*/
					if(!!_dc) {
						_data = __libs.config.getDataSource(_dc);

						if(!!_data) {
							if(!!_c.multiple) {
								var _arr = [];
								$(_data).each(function(i,x) {
									if($.inArray(x.COD_STRUTTURA_FIGLIO, _arr) < 0)
										_arr.push(x.COD_STRUTTURA_FIGLIO);
									if($.inArray(x.COD_STRUTTURA_STAFF, _arr) < 0)
										_arr.push(x.COD_STRUTTURA_STAFF);
								});
								//console.log("\n\n\ndevo eliminare i valori != da", _arr);
								if($this.is("select")) {
									$('option', this).each(function(i, x) {
										if($.inArray(x.value, _arr) < 0) {
											$(x).remove();
										}
									});
								}
							}
							else {
								_data = $.isArray(_data) ? _data[0] : _data;
								if(!!_data) {
									var valore = _data[_c["ref-field-value"]];
									if($this.is("select")) {

										if($this.hasClass("ced-combobox")) {
											$this.next().find("input").val(valore);
											$this.combobox("validate");
										}
										$(String.format("option[value='{0}']", valore), this).attr("selected", "selected");
									}
									else {
										$this.val(valore);
									}									
								}
							}							
						}
					}
				}

			});
		}
	}

})(jQuery);