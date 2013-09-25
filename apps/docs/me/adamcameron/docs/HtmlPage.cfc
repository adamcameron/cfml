// HTMLPage.cfc
component {

	variables.baseUrl	= "";
	variables.pageName	= "";

	public HtmlPage function init(){
		variables.jSoup		= new JSoup().getJSoup();
		variables.docObject	= variables.jSoup.connect(variables.baseUrl & variables.pageName).get();

		return this;
	}

}