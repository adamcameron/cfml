$(document).ready(
	function(){
		var $searchForm		= $("#frm");
		var $productSelect	= $("select[name=product]", $searchForm);	
		var $versionSelect	= $("select[name=version]", $searchForm);
		var $keywordsInput	= $("input[name=keywords]", $searchForm);
		var $searchSubmit	= $("input[name=btnSearch]", $searchForm);
		var $results		= $("#results");
		var $resultsTable	= $("#resultsTable");
		var $resultsDisplay	= $("#resultsDisplay");
		var $resultsTabs	= $("#resultsTabs");

		// create necessary objects
		// init and config the search form
		var searchFormConfig	= new SearchFormConfig();
		var searchForm			= new SearchForm(
			searchFormConfig,
			{
				$productSelect	: $productSelect,
				$versionSelect	: $versionSelect,
				$keywordsInput	: $keywordsInput,
				$resultsTable	: $resultsTable,
				$results		: $results,
				$resultsTabs	: $resultsTabs,
				$resultsDisplay	: $resultsDisplay
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
		var searchProxy = new SearchProxy(searchProxyConfig.settings, searchFormConfig);
		var $searchProxy = $(searchProxy);

		// render the results divs as tabs
		$resultsTabs.tabs();


		// link 'em together
		$searchForm.on(
			{
				needResults		: function(){
					searchForm.resetResults();
					searchProxy.getResults();
				},
				needDetails		: searchProxy.getDetails
			}
		);
		$searchProxy.on(
			{
				haveResults			: function(event, data){
					searchForm.showResults();
					searchForm.populateResults(event, data);
				},
				ajaxComplete		: searchProxy.trackSearches,
				searchesComplete	: searchForm.finaliseSearch
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

