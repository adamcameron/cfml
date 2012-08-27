function SearchForm(formElements){
	for (var element in formElements){
		this[element] = formElements[element];
	}
	return this;
}

SearchForm.prototype.populateProducts = function(){
	console.log("populateProducts() called");
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
