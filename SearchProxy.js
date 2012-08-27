function SearchProxy(proxySettings, searchFormConfig){
	_searchProxy = this;
	this.proxySettings		= proxySettings;
	this.searchFormConfig	= searchFormConfig;
	return this;
}


SearchProxy.prototype.getResults = function(){
	var products;
	var versions;
	var productIdx			= 0;
	var productId 			= 0;
	var versionIdx			= 0;
	var versionId			= 0;
	var fieldIdx			= 0;
	var thisField			= "";
	var staticParams				= _searchProxy.resolveParams();
	var selectedProductId	= _searchProxy.proxySettings.callbacks.getProductId();
	var selectedVersionId	= _searchProxy.proxySettings.callbacks.getVersionId();
	var keywords			= _searchProxy.proxySettings.callbacks.getKeywords();
	var searchParams;
	
	if (selectedProductId != -1 && _searchProxy.searchFormConfig.products.lookup[selectedProductId]){
		// this specific product
		products = [_searchProxy.searchFormConfig.products.lookup[selectedProductId].product];
	}else{
		// all products
		products = _searchProxy.searchFormConfig.products.details;
	}
	
	// loop over all the chosen products...
	for (productIdx=0; productIdx < products.length; productIdx++){
		productId = products[productIdx].id;
		if (selectedVersionId != -1 && _searchProxy.searchFormConfig.products.lookup[productId][selectedVersionId]){
			// this specific product
			versions = [_searchProxy.searchFormConfig.products.lookup[productId][selectedVersionId]];
		}else{
			// all products
			versions = products[productIdx].versions;
		}
		// loop over all the versions within the product
		for (versionIdx=0; versionIdx < versions.length; versionIdx++){
			versionId = versions[versionIdx].id;
			// set the product & version IDs into the params
			
			for (fieldIdx=0; fieldIdx < _searchProxy.proxySettings.fields.length; fieldIdx++){
				searchParams = $.extend({}, staticParams);

				// now set the ones for this search
				searchParams[_searchProxy.proxySettings.dynamicParamMap.product] = productId;
				searchParams[_searchProxy.proxySettings.dynamicParamMap.version] = versionId;

				// set the specific field to search
				var thisField = _searchProxy.proxySettings.fields[fieldIdx];
				searchParams[thisField] = keywords;
				
				_searchProxy.makeAjaxCall(searchParams);
			}
			
		}
	}
};


SearchProxy.prototype.makeAjaxCall = function(params){
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



SearchProxy.prototype.resolveParams = function(){
	var params = {
		proxiedUrl	: _searchProxy.proxySettings.bugbaseUrl,
	};
	for (var param in _searchProxy.proxySettings.staticParams){
		params[param] = _searchProxy.proxySettings.staticParams[param];
	}
	return params;
}


SearchProxy.prototype.createResultData = function(args){
	console.log("createResultData() called");
	console.log(args);
	$(_searchProxy).trigger("haveResults");
}