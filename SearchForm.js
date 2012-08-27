function SearchForm(config, formElements){
	this.config = config;

	for (var element in formElements){
		this[element] = formElements[element];
	}
	
	_searchForm = this;
	return this;
}


SearchForm.prototype.getProducts = function(){
	var optionMarkup	= '<option value="-1">All</option>';
	var thisProduct		= "";
	
	this.$productSelect.find("option").remove().end().append(optionMarkup);

	for (var i=0; i < this.config.products.details.length; i++){
		optionMarkup = '<option value="' + this.config.products.details[i].id + '">' + this.config.products.details[i].name + '</option>';
		this.$productSelect.find("option").end().append(optionMarkup);
	}
};


SearchForm.prototype.getVersions = function(event){
	var optionMarkup	= '<option value="-1">All</option>';
	var thisProduct = $(this).val();
	_searchForm.$versionSelect.find("option").remove().end().append(optionMarkup);
	if (_searchForm.config.products.lookup[thisProduct]){
		var theseVersions = _searchForm.config.products.lookup[thisProduct].product.versions;
	
		for (var i=0; i < theseVersions.length; i++){
			optionMarkup = '<option value="' + theseVersions[i].id + '">' + theseVersions[i].name + '</option>';
			_searchForm.$versionSelect.find("option").end().append(optionMarkup);
		}
	}
}


SearchForm.prototype.populateResults = function(event, params){
	console.log("populateResults() called");
}


SearchForm.prototype.resetTable = function(event, params){
	_searchForm.$resultsTable.html("");
}


SearchForm.prototype.getProductId = function(){
	productId = _searchForm.$productSelect.find(":selected").val()
	return productId;
}

SearchForm.prototype.getVersionId = function(){
	versionId = _searchForm.$versionSelect.find(":selected").val()
	return versionId;
}

SearchForm.prototype.getKeywords = function(){
	console.log("getKeywords() called");
	productId = _searchForm.$keywordsInput.val()
	return productId;
}
