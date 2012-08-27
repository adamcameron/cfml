$(document).ready(
	function(){
		$searchForm		= $("#frm");
		$productSelect	= $("input[name='product']", $searchForm);	
		$versionSelect	= $("input[name='version']", $searchForm);
		$searchSubmit	= $("input[name='btnSearch']", $searchForm);
	
	function foo(args){
		console.log("window.foo");
		console.log(args);
	}	
		
		// create necessary objects
		searchForm = new SearchForm(
			{
				$productSelect	: $productSelect
			}
		);
		$searchForm = $(searchForm);

		searchProxyConfig = new SearchProxyConfig(
			{
				getProductId	: searchForm.getProductId,
				getVersionId	: searchForm.getVersionId,
				getSearchValue	: searchForm.getSearchValue
			}
		);

console.log(searchProxyConfig.settings);

		searchProxy = new SearchProxy(searchProxyConfig.settings);
		$searchProxy = $(searchProxy);

		$searchForm.on(
			"needProducts",
			searchProxy.getProducts
		);
		
		$searchProxy.on(
			"haveProducts",
			searchForm.populateProducts
		);
		
		$searchForm.trigger("needProducts");	

		
		// form control binds
		$productSelect.on(
			"change",
			searchForm.populateVersion
		);
		$searchSubmit.on(
			"click",
			searchForm.performSearch
		);
		
		
	}
);