function SearchProxy(proxySettings, searchFormConfig, detailExtractor){
	_searchProxy = this;
	this.proxySettings		= proxySettings;
	this.searchFormConfig	= searchFormConfig;
	this.detailExtractor	= detailExtractor;
	
	
	this.numberOfSearches	= 0;
	this.completedSearches	= 0;
	
	return this;
}


/**
  Organises what searches to do, then does them
 */
SearchProxy.prototype.getResults = function(){
	var products;
	var versions;
	var productIdx			= 0;
	var productId			= 0;
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
				thisField = _searchProxy.proxySettings.listingRequests.fields[fieldIdx];
				searchParams[thisField] = keywords;
				
				$.ajax({
					url			: _searchProxy.proxySettings.proxyUrl,
					dataType	: "jsonp",
					data		: searchParams,
					success		: _searchProxy._ajaxSuccessHandler,
					error		: _searchProxy._ajaxErrorHandler,
					complete	: _searchProxy._ajaxCompleteHandler
				});
			}
		}
	}
};


/**
  Gets the specified details from Adobe
 * @param {Object} event
 * @param {Object} data
 */
SearchProxy.prototype.getDetails = function(event, data){
	var params = {
		proxiedUrl	: _searchProxy.proxySettings.bugbaseUrl,
		handler	: _searchProxy.proxySettings.detailRequests.handler
	};
	params[_searchProxy.proxySettings.detailRequests.eventParam]	=_searchProxy.proxySettings.detailRequests.eventValue;
	params[_searchProxy.proxySettings.detailRequests.idParam]		= data.bugId;
	  
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


/**
  Just returns the params for a listing AJAX call
 */
SearchProxy.prototype.resolveListingParams = function(){
	var params = {
		proxiedUrl	: _searchProxy.proxySettings.bugbaseUrl
	};
	for (var param in _searchProxy.proxySettings.listingRequests.staticParams){
		params[param] = _searchProxy.proxySettings.listingRequests.staticParams[param];
	}
	return params;
}


/**
  Creates the data for the listing page from the passed-in object which will have come from an AJAX request back to Adobe
 * @param {Object} data
 */
SearchProxy.prototype.createListingData = function(data){
	var results = [];
	var result;
	var rows = data.payload.QUERY.DATA;
	for (result in rows){	// "AD_S_DEFECT_ID","AD_S_STATUS","AD_S_REASON","AD_S_TITLE","AD_S_CREATED_DT","DEFID"
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


/**
  Creates the data for the detail page from the passed-in object which will have come from an AJAX request back to Adobe
 * @param {Object} data
 */
SearchProxy.prototype.createDetailData = function(data){
	_searchProxy.detailExtractor.setDoc(data.payload);
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
		comments		: _searchProxy.detailExtractor.getComments(),
		id				: data.id
	};
	$(_searchProxy).trigger("haveDetailResults", details);

}


/**
  Keeps track fo how many searches we've done, and how many left to complete
 */
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


// "PRIVATE" methods


/**
  Generic success handler.  Factored-out form inline, as it was in a loop so didn't want to create a new function everytime
 * @param {Object} data
 * @param {Object} textStatus
 * @param {Object} jqXHR
 */
SearchProxy.prototype._ajaxSuccessHandler = function(data, textStatus, jqXHR){
}


/**
  Generic error handler.  Factored-out form inline, as it was in a loop so didn't want to create a new function everytime
 * @param {Object} jqXHR
 * @param {Object} textStatus
 * @param {Object} errorThrown
 */
SearchProxy.prototype._ajaxErrorHandler = function(jqXHR, textStatus, errorThrown){
	console.log(jqXHR);
	console.log(textStatus);
	console.log(errorThrown);
}


/**
   "complete" handler.  Factored-out form inline, as it was in a loop so didn't want to create a new function everytime
 * @param {Object} jqXHR
 * @param {Object} textStatus
 */
SearchProxy.prototype._ajaxCompleteHandler = function(jqXHR, textStatus){
	$(_searchProxy).trigger("listingAjaxComplete");
}
