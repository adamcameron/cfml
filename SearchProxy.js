function SearchProxy(proxySettings){
	_SearchProxy = this;	// can't call it _this or _self due to the way the context of some of the callbacks are used.  Needs a name unique to this class
	this.proxySettings = proxySettings;
	return this;
}

SearchProxy.prototype.getProducts = function(){
	var params = _SearchProxy.resolveParams("products");
	params.handler	= "_SearchProxy.createProductData";
	$.ajax({
		url			: _SearchProxy.proxySettings.proxyUrl,
		dataType	: "jsonp",
		data		: params,
		success		: function(data, textStatus, jqXHR){
			console.log("success");
		},
		error		: function(jqXHR, textStatus, errorThrown){
			console.log("error");
		},
		complete	: function(jqXHR, textStatus){
			console.log("complete");
		}
	});
	
}

SearchProxy.prototype.resolveParams = function(which){
	var params = {
		proxiedUrl	: _SearchProxy.proxySettings.bugbaseUrl,
	};
	var theseParams = _SearchProxy.proxySettings.calls[which].params;
	for (var param in theseParams){
		// it might be a callback, if so: call it
		if (!!(theseParams[param] && theseParams[param].constructor && theseParams[param].call && theseParams[param].apply)){
			params[param] = theseParams[param]();
		}else{	// otherwise it'll be a simple value
			params[param] = theseParams[param];
		}
	}
	return params;
}

SearchProxy.prototype.createProductData = function(args){
	// we only care about CF, so just get those ones
	var cfProducts = [];
	for (var i=0; i < args.DATA.length; i++){
		if (/.*coldfusion.*/gi.test(args.DATA[i][0])){
			cfProducts.push({
				id	: args.DATA[i][1],
				name: args.DATA[i][0]
			});
		}
	}
	$(_SearchProxy).trigger("haveProducts", {products:cfProducts});
}

