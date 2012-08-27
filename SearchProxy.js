function SearchProxy(proxySettings){
	_this = this;
	this.proxySettings = proxySettings;
	return this;
}

SearchProxy.prototype.getProducts = function(){
	var params = _this.resolveParams("products");
	params.handler	= "_this.fooxxx";
	$.ajax({
		url			: _this.proxySettings.proxyUrl,
		dataType	: "jsonp",
		data		: params,
		success		: function(data, textStatus, jqXHR){
			console.log("success");
		},
		error		: function(jqXHR, textStatus, errorThrown){
			console.log("error");
			// not sure what's going on, but an error is being flagged even though everything has run fine
			if (jqXHR.statusText != "success"){
				throw errorThrown;
			}
		},
		complete	: function(jqXHR, textStatus){
			console.log("complete");
		}
	});
	$(_this).trigger("haveProducts");
}

SearchProxy.prototype.resolveParams = function(which){
	var params = {
		proxiedUrl	: _this.proxySettings.bugbaseUrl,
	};
	var theseParams = _this.proxySettings.calls[which].params;
	for (var param in theseParams){
		// it might be a callback, if so: call it
		if (!!(theseParams[param] && theseParams[param].constructor && theseParams[param].call && theseParams[param].apply)){
			params[param] = theseParams[param]();
		}else{	// otherwise it'll be a simple value
			params[param] = theseParams[param];
		}
	}
	console.log("resolveParams");
	console.log(params);
	return params;
}

SearchProxy.prototype.fooxxx = function(args){
	console.log("SearchProxy.fooxxx() WAS called");
	console.log(args);
	//return args;
}
