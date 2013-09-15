component extends="CfmlReferencePage" {

	variables.pageName = variables.adobeReferences.functionIndexPage;

	public array function getListingPages(){
		var listingElements = variables.docObject.select("##inner_content_table ul.navlinklist>li>a:matchesOwn(^Functions\s[a-z](?:-[a-z])?$)");

		var functions = [];
		for (var functionObject in listingElements){
			arrayAppend(functions, {
				name = functionObject.text(),
				url = functionObject.attr("href")
			});
		}
		return functions;
	}

	public array function getFunctions(){
		var functions = [];
		var listingPages = getListingPages();
		for (listingPage in listingPages){
			var functionListPage = new FunctionListPage(listingPage.url);
			arrayAppend(functions, functionListPage.getFunctions(), true);
		}
		return functions;
	}

}