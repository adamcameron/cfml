function SearchProxy(proxySettings, searchFormConfig, detailExtractor){
	_searchProxy = this;
	this.proxySettings		= proxySettings;
	this.searchFormConfig	= searchFormConfig;
	this.detailExtractor	= detailExtractor;
	
	
	this.numberOfSearches	= 0;
	this.completedSearches	= 0;
	
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
	var staticParams		= _searchProxy.resolveListingParams();
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
			
			for (fieldIdx=0; fieldIdx < _searchProxy.proxySettings.listingRequests.fields.length; fieldIdx++){
				_searchProxy.numberOfSearches ++;
				searchParams = $.extend({}, staticParams);

				// now set the ones for this search
				searchParams[_searchProxy.proxySettings.listingRequests.dynamicParamMap.product] = productId;
				searchParams[_searchProxy.proxySettings.listingRequests.dynamicParamMap.version] = versionId;

				// set the specific field to search
				var thisField = _searchProxy.proxySettings.listingRequests.fields[fieldIdx];
				searchParams[thisField] = keywords;
				
				$.ajax({
					url			: _searchProxy.proxySettings.proxyUrl,
					dataType	: "jsonp",
					data		: searchParams,
					success		: function(data, textStatus, jqXHR){
					},
					error		: function(jqXHR, textStatus, errorThrown){
						console.log(jqXHR);
						console.log(textStatus);
						console.log(errorThrown);
					},
					complete	: function(jqXHR, textStatus){
						$(_searchProxy).trigger("listingAjaxComplete");
					}
				});


			}
		}
	}
};

SearchProxy.prototype.getDetails = function(event, data){
	var params = {
		proxiedUrl	: _searchProxy.proxySettings.bugbaseUrl,
		handler	: _searchProxy.proxySettings.detailRequests.handler
	};
	params[_searchProxy.proxySettings.detailRequests.eventParam]	=_searchProxy.proxySettings.detailRequests.eventValue;
	params[_searchProxy.proxySettings.detailRequests.idParam] 		= data.bugId;
	  
	$.ajax({
		url			: _searchProxy.proxySettings.proxyUrl,
		dataType	: "jsonp",
		data		: params,
		success		: function(data, textStatus, jqXHR){
		},
		error		: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR);
			console.log(textStatus);
			console.log(errorThrown);
		},
		complete	: function(jqXHR, textStatus){
			$(_searchProxy).trigger("detailAjaxComplete");
		}
	});
}


SearchProxy.prototype.resolveListingParams = function(){
	var params = {
		proxiedUrl	: _searchProxy.proxySettings.bugbaseUrl,
	};
	for (var param in _searchProxy.proxySettings.listingRequests.staticParams){
		params[param] = _searchProxy.proxySettings.listingRequests.staticParams[param];
	}
	return params;
}


SearchProxy.prototype.createListingData = function(data){
	var results = [];
	var result;
	var rows = data.results.QUERY.DATA;
	for (result in rows){	// "AD_S_DEFECT_ID","AD_S_STATUS","AD_S_REASON","AD_S_TITLE","AD_S_CREATED_DT"
		results.push({
			id			: rows[result][0],
			status		: rows[result][1],
			subStatus	: rows[result][2],
			title		: rows[result][3],
			date		: rows[result][4],
			product		: _searchProxy.searchFormConfig.products.lookup[data.product].product.name,
			version		: _searchProxy.searchFormConfig.products.lookup[data.product][data.version].name
		});
	}
	$(_searchProxy).trigger("haveListingResults", [results]);
}


SearchProxy.prototype.createDetailData = function(data){
	_searchProxy.detailExtractor.setDoc(data);
	var details = {
		headLine		: _searchProxy.detailExtractor.getHeadline(),
		date			: _searchProxy.detailExtractor.getDate(),
		bugTitle		: _searchProxy.detailExtractor.getTitle(),
		bugDescription	: _searchProxy.detailExtractor.getDescription(),
		reportedBy		: _searchProxy.detailExtractor.getReportedBy(),
		status			: _searchProxy.detailExtractor.getStatus(),
		foundInBuild	: _searchProxy.detailExtractor.getFoundInBuild(),
		fixedInBuild	: _searchProxy.detailExtractor.getFixedInBuild(),
		votes			: _searchProxy.detailExtractor.getVotes(),
		comments		: _searchProxy.detailExtractor.getComments()
	};
	$(_searchProxy).trigger("haveDetailResults", details);

}


SearchProxy.prototype.trackSearches = function(){
	_searchProxy.completedSearches++;
	if (_searchProxy.completedSearches >= _searchProxy.numberOfSearches){
		// we're all done
		$(_searchProxy).trigger("searchesComplete");
		// reset for next time
		_searchProxy.completedSearches	= 0;
		_searchProxy.numberOfSearches	= 0;
	}
}
