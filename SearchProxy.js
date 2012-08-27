function SearchProxy(proxySettings){
	_searchProxy = this;
	this.proxySettings	= proxySettings;
	return this;
}


SearchProxy.prototype.getResults = function(){
	console.log("getResults() called");
	var params = _searchProxy.resolveParams("search");
	params.handler	= "_searchProxy.createResultData";
	$.ajax({
		url			: _searchProxy.proxySettings.proxyUrl,
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
		proxiedUrl	: _searchProxy.proxySettings.bugbaseUrl,
	};
	var theseParams = _searchProxy.proxySettings.calls[which].params;
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


SearchProxy.prototype.createResultData = function(args){
	console.log("createResultData() called");
	console.log(args);
	$(_searchProxy).trigger("haveResults");
}

