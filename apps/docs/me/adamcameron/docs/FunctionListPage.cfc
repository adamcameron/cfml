component extends="CfmlReferencePage" {

	public FunctionListPage function init(required string pageName){
		variables.pageName = arguments.pageName;
		super.init();
		return this;
	}

	public array function getFunctions(){
		var functionObjects = variables.docObject.select("##inner_content_table ul.navlinklist>li>a");
		var functions = [];
		for (var functionObject in functionObjects){
			arrayAppend(functions, {
				name = functionObject.text(),
				url = functionObject.attr("href")
			});
		}
		return functions;
	}

}