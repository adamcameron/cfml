function SearchForm(config, formElements){
	this.config = config;

	for (var element in formElements){
		this[element] = formElements[element];
	}
	
	this.displayedBugs = [];	
	
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


SearchForm.prototype.populateResults = function(event, rows){
	var i;
	var resultRowMarkup;
	for (i=0; i < rows.length; i++){
		if (_searchForm.displayedBugs.indexOf(rows[i].id) === -1){	// only display ones we've not already displayed
			_searchForm.displayedBugs.push(rows[i].id);
			resultRowMarkup = "<tr>";
			resultRowMarkup += '<td data-bugid="'+ rows[i].id +'" class="clickable"><a href="#">' + rows[i].id + '</a></td>';
			resultRowMarkup += "<td>" + _searchForm.formatDate(rows[i].date) + "</td>";
			resultRowMarkup += '<td data-bugid="'+ rows[i].id +'" class="clickable"><a href="#">'  + rows[i].title +  "</a></td>";
			resultRowMarkup += '<td class="filterable">'  + rows[i].status +  "</td>"
			resultRowMarkup += '<td class="filterable">'  + rows[i].subStatus +  "</td>";
			resultRowMarkup += '<td class="filterable">'  + rows[i].product +  "</td>";
			resultRowMarkup += '<td class="filterable">'  + rows[i].version +  "</td>";
			resultRowMarkup += "</tr>";
			_searchForm.$results.find("tr").end().append(resultRowMarkup);
			_searchForm.$results.find("tr:last").on(
				"click",
				".clickable",
				function(){
					$(_searchForm).trigger("needDetails", {bugId:$(this).attr("data-bugid")});
				}
			);
		}
	}
}


SearchForm.prototype.resetResults = function(event, params){
	_searchForm.displayedBugs = [];
	_searchForm.$results.html("");
}


SearchForm.prototype.showResults = function(){
	if (_searchForm.$resultsDisplay.hasClass("hide")){
		_searchForm.$resultsDisplay.removeClass("hide").addClass("show");
	}
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
	productId = _searchForm.$keywordsInput.val()
	return productId;
}


SearchForm.prototype.formatDate = function(date){
	var theDate = new Date(date);
	var theDay = theDate.getDate();
	var theMonth = theDate.getMonth()+1;
	
	theDay = theDay < 10 ? "0" + theDay: theDay;
	theMonth = theMonth < 10 ? "0" + theMonth: theMonth;
	var formatted = theDate.getFullYear() + "-" + theMonth + "-" + theDay;
	return formatted;
}


SearchForm.prototype.finaliseSearch = function(){
	console.log("finaliseSearch() called");
	_searchForm.$resultsTable.tablesorter(
		{
			sortList: [[5,1],[6,1],[0,0]]
		}
	);

	var filterText = "";
	var filterColumns = ["ID", "Date", "Title", "Status", "Substatus", "Product", "Version"];
	for (var i=3; i < filterColumns.length; i++) {
		_searchForm.$resultsTable.find("tbody tr").find("td:eq(" + i + ")").on(
			"click",
			function() {
				var clickedText = $(this).text();
				filterText = ((filterText === clickedText) ? "" : clickedText );
				$.uiTableFilter(_searchForm.$resultsTable, filterText, filterColumns[i]);
			}
		);
	}


}