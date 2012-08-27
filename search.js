$(document).ready(
	function(){
		var $searchForm		= $("#frm");
		var $productSelect	= $("select[name=product]", $searchForm);	
		var $versionSelect	= $("select[name=version]", $searchForm);
		var $keywordsInput	= $("input[name=keywords]", $searchForm);
		var $searchSubmit	= $("input[name=btnSearch]", $searchForm);
		var $resultsTable	= $("#results");

		// create necessary objects
		// init and config the search form
		var searchFormConfig	= new SearchFormConfig();
		var searchForm			= new SearchForm(
			searchFormConfig,
			{
				$productSelect	: $productSelect,
				$versionSelect	: $versionSelect,
				$keywordsInput	: $keywordsInput,
				$resultsTable	: $resultsTable
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
		var searchProxy = new SearchProxy(searchProxyConfig.settings);
		var $searchProxy = $(searchProxy);


		// link 'em together
		$searchForm.on(
			{
				needResults		: function(){
					searchForm.resetTable();
					searchProxy.getResults();
				}
			}
		);
		$searchProxy.on("haveResults", searchForm.populateResults);
		

		
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