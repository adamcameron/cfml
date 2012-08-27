function SearchForm(formElements){
	_SearchForm = this;	// can't call it _this or _self due to the way the context of some of the callbacks are used.  Needs a name unique to this class

	for (var element in formElements){
		this[element] = formElements[element];
	}
	
	return this;
}


SearchForm.prototype.populateProducts = function(event, params){
	console.log("populateProducts() called");
	var optionMarkup	= '<option value="-1">All</option>';
	var thisProduct		= "";
	
	_SearchForm.$productSelect.find("option").remove().end().append(optionMarkup);

	for (var i=0; i < params.products.length; i++){
		optionMarkup = '<option value="' + params.products[i].id + '">' + params.products[i].name + '</option>';
		_SearchForm.$productSelect.find("option").end().append(optionMarkup);
	}
}


SearchForm.prototype.populateVersions = function(event, params){
	console.log("populateVersions() called");
	var optionMarkup	= '<option value="-1">All</option>';
	var thisVersion		= "";
	
	_SearchForm.$versionSelect.find("option").remove().end().append(optionMarkup);

	for (var i=0; i < params.versions.length; i++){
		optionMarkup = '<option value="' + params.versions[i].id + '">' + params.versions[i].name + '</option>';
		_SearchForm.$versionSelect.find("option").end().append(optionMarkup);
	}
}

SearchForm.prototype.performSearch = function(){
	console.log("performSearch() called");
}


SearchForm.prototype.getProductId = function(){
	productId = _SearchForm.$productSelect.find(":selected").val()
	return productId;
}

SearchForm.prototype.getVersionId = function(){
	console.log("getVersionId() called");
}

SearchForm.prototype.getSearchValue = function(){
	console.log("getSearchValue() called");
}
