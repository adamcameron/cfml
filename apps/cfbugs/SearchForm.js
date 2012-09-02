function SearchForm(config, formElements){
	var element;
	this.config = config;

	for (element in formElements){
		this[element] = formElements[element];
	}
	
	this.displayedBugs = [];	
	
	_searchForm = this;
	return this;
}


/**
  Sets the proxy config
 * @param {Object} proxyConfig
 */
SearchForm.prototype.setProxyConfig = function(proxyConfig){
	this.proxyConfig = proxyConfig;
}


/**
  Populates the products dropdown
 */
SearchForm.prototype.getProducts = function(){
	var optionMarkup	= '<option value="-1">All</option>';
	var thisProduct		= "";
	var i;
	
	this.$productSelect.find("option").remove().end().append(optionMarkup);

	for (i=0; i < this.config.products.details.length; i++){
		optionMarkup = '<option value="' + this.config.products.details[i].id + '">' + this.config.products.details[i].name + '</option>';
		this.$productSelect.find("option").end().append(optionMarkup);
	}
};


/**
  Populates the versions dropdown on the basis of the product selection made (via the event)
 * @param {Object} event
 */
SearchForm.prototype.getVersions = function(event){
	var optionMarkup	= '<option value="-1">All</option>';
	var thisProduct = $(this).val();
	var theseVersions;
	var i;
	_searchForm.$versionSelect.find("option").remove().end().append(optionMarkup);
	if (_searchForm.config.products.lookup[thisProduct]){
		theseVersions = _searchForm.config.products.lookup[thisProduct].product.versions;
	
		for (i=0; i < theseVersions.length; i++){
			optionMarkup = '<option value="' + theseVersions[i].id + '">' + theseVersions[i].name + '</option>';
			_searchForm.$versionSelect.find("option").end().append(optionMarkup);
		}
	}
}


/**
  Populates the result listing with the passed-in rows data
 * @param {Array} rows
 */
SearchForm.prototype.populateListingResults = function(rows){
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


/**
  Blanks out the results, ready for the next search
 * @param {Object} event
 * @param {Object} params
 */
SearchForm.prototype.resetResults = function(){
	_searchForm.displayedBugs = [];
	_searchForm.$results.html("");
}


/**
  Displays the results if they are hidden
 */
SearchForm.prototype.showResults = function(){
	if (_searchForm.$resultsDisplay.hasClass("hide")){
		_searchForm.$resultsDisplay.removeClass("hide").addClass("show");
	}
}


/**
  gets the currently-selected product ID
 */
SearchForm.prototype.getProductId = function(){
	var productId = _searchForm.$productSelect.find(":selected").val();
	return productId;
}


/**
  gets the currently-selected version ID
 */
SearchForm.prototype.getVersionId = function(){
	var versionId = _searchForm.$versionSelect.find(":selected").val();
	return versionId;
}


/**
  gets the keywords from the text input
 */
SearchForm.prototype.getKeywords = function(){
	var keywords = _searchForm.$keywordsInput.val();
	return keywords;
}


/**
  formats a date object in terse but locale-neutral format: yyyy-mm-dd
 * @param {Date} date
 */
SearchForm.prototype.formatDate = function(date){
	var theDate = new Date(date);
	var theDay = theDate.getDate();
	var theMonth = theDate.getMonth()+1;
	
	theDay = theDay < 10 ? "0" + theDay: theDay;
	theMonth = theMonth < 10 ? "0" + theMonth: theMonth;
	var formatted = theDate.getFullYear() + "-" + theMonth + "-" + theDay;
	return formatted;
}


/**
  handler for when the search has finished.  Re-sorts the table , adds filter event handlers
 */
SearchForm.prototype.finaliseSearch = function(){
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


/**
  Populates the details tab using the passed-in data
 * @param {Object} data
 */
SearchForm.prototype.populateDetailResults = function(data){
	var bugMarkup = "";
	bugMarkup += "<h2>" + data.headLine + "</h2>";
	bugMarkup += "<p>" + data.date + "</p>";
	bugMarkup += "<h3>" + data.bugTitle + "</h3>";
	bugMarkup += "<p>Reported by: " + data.reportedBy+ "</p>";
	bugMarkup += "<p>Found in: " + data.foundInBuild + "</p>";
	bugMarkup += "<p>Fixed in: " + data.fixedInBuild + "</p>";
	bugMarkup += "<p>Status: " + data.status + "</p>";
	bugMarkup += '<div class="bugDescription">' + data.bugDescription + "</div>";
	
	var adobeUrl = _searchForm._getAdobeUrl(data.id);
	bugMarkup += '<p><a href="' + adobeUrl + '" target="_blank">View Bug on Adobe Bugtracker</a></p>';
	
	bugMarkup += "<h4>Comments (" + data.comments.length + ")</h4>";
	if (data.comments.length){
		for (var i=0; i < data.comments.length; i++){
			bugMarkup += "<p>" + data.comments[i].name + "</p>";
			bugMarkup += "<p>" + data.comments[i].date + "</p>";
			bugMarkup += "<p>" + data.comments[i].comment + "</p>";
			bugMarkup += "<hr />";
		}
	}else{
		bugMarkup += "<p>NONE</p>";
	}
	
	bugMarkup += "<h4>Votes (" + data.votes.length + ")</h4>";
	if (data.votes.length){
		for (var i=0; i < data.votes.length; i++){
			bugMarkup += "<p>" + data.votes[i].name + "</p>";
			bugMarkup += "<p>" + data.votes[i].date + "</p>";
			bugMarkup += "<p>" + data.votes[i].comment + "</p>";
			bugMarkup += "<hr />";
		}
	}else{
		bugMarkup += "<p>NONE</p>";
	}
	
	_searchForm.$resultsTabDetail.html("").append(bugMarkup);
	_searchForm.$resultsTabs.tabs("select", 1);
}


/**
  returns the Adobe URL for a specific bug
 * @param {Integer} id
 */
SearchForm.prototype._getAdobeUrl = function(id){
console.log(_searchForm.proxyConfig);
	var adobeUrl	= _searchForm.proxyConfig.bugbaseUrl
					+ "?" + _searchForm.proxyConfig.detailRequests.eventParam + "=" + _searchForm.proxyConfig.detailRequests.eventValue
					+ "&" + _searchForm.proxyConfig.detailRequests.idParam + "=" + id;
	;
	return adobeUrl;
}