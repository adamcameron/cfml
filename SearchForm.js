function SearchForm(formElements){
	_SearchForm = this;	// can't call it _this or _self due to the way the context of some of the callbacks are used.  Needs a name unique to this class

	for (var element in formElements){
		this[element] = formElements[element];
	}
	
	console.log(_SearchForm);
	return this;
}


SearchForm.prototype.populateProducts = function(event, params){
	var optionMarkup	= '<option value="-1">All</option>';
	var thisProduct		= "";
	
	_SearchForm.$productSelect.find("option").remove().end().append(optionMarkup);

	for (var i=0; i < params.products.length; i++){
		optionMarkup = '<option value="' + params.products[i].id + '">' + params.products[i].name + '</option>';
		_SearchForm.$productSelect.find("option").end().append(optionMarkup);
	}
}


SearchForm.prototype.populateVersion = function(){
	console.log("populateVersion() called");
}

SearchForm.prototype.performSearch = function(){
	console.log("performSearch() called");
}

SearchForm.prototype.getProductId = function(){
	console.log("getProductId() called");
}

SearchForm.prototype.getVersionId = function(){
	console.log("getVersionId() called");
}

SearchForm.prototype.getSearchValue = function(){
	console.log("getSearchValue() called");
}
