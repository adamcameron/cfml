$(document).ready(
	function(){
		var $searchForm			= $("#frm");
		var $productSelect		= $("select[name=product]", $searchForm);	
		var $versionSelect		= $("select[name=version]", $searchForm);
		var $keywordsInput		= $("input[name=keywords]", $searchForm);
		var $searchSubmit		= $("input[name=btnSearch]", $searchForm);
		var $results			= $("#results");
		var $resultsTable		= $("#resultsTable");
		var $resultsDisplay		= $("#resultsDisplay");
		var $resultsTabs		= $("#resultsTabs");
		var $resultsTabDetail	= $("#resultsTabDetail");
		var $bugSearch			= $("#bugSearch");

		// create necessary objects
		// init and config the search form
		var searchFormConfig	= new SearchFormConfig();
		var searchForm			= new SearchForm(
			searchFormConfig,
			{
				$productSelect		: $productSelect,
				$versionSelect		: $versionSelect,
				$keywordsInput		: $keywordsInput,
				$results			: $results,
				$resultsTable		: $resultsTable,
				$resultsDisplay		: $resultsDisplay,
				$resultsTabs		: $resultsTabs,
				$resultsTabDetail	: $resultsTabDetail
			}
		);
		var $searchForm = $(searchForm);
		searchForm.getProducts();	


		//init and configure the search proxy
		var searchProxyConfig = new SearchProxyConfig(
			{
				getProductId	: searchForm.getProductId,
				getVersionId	: searchForm.getVersionId,
				getKeywords		: searchForm.getKeywords
			}
		);
		var searchProxy = new SearchProxy(searchProxyConfig.settings, searchFormConfig, new DetailExtractor());
		var $searchProxy = $(searchProxy);
		
		searchForm.setProxyConfig(searchProxyConfig.settings);	// need URL info from this

		// render the results divs as tabs
		$resultsTabs.tabs();
		
		// switch the table sorter one
		$resultsTable.tablesorter(
			{
				sortList: [[5,1],[6,1],[0,0]]
			}
		);

		// link 'em together
		$searchForm.on(
			{
				needResults		: function(){
					$bugSearch.addClass("wait");
					searchForm.resetResults();
					searchProxy.getResults();
				},
				needDetails		: function(event, data){
					$bugSearch.addClass("wait");
					searchProxy.getDetails(event, data);
				}
			}
		);
		$searchProxy.on(
			{
				haveListingResults	: function(event, data){
					searchForm.showResults();
					searchForm.populateListingResults(data);

				},
				listingAjaxComplete	: searchProxy.trackSearches,
				searchesComplete	: function(){
					searchForm.finaliseSearch();
					$bugSearch.removeClass("wait");
				},
				haveDetailResults	: function(event, data){ 
					searchForm.populateDetailResults(data);
					$bugSearch.removeClass("wait");
				}
			}
		);
		

		// form control binds
		$productSelect.on(
			"change",
			searchForm.getVersions
		);
		$searchSubmit.on(
			"click",
			function(){
				$searchForm.trigger("needResults");	
			}
		);
	}
); 