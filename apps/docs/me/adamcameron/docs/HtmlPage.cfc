component {

	variables.baseUrl	= "";
	variables.pageName	= "";

	public HtmlPage function init(){
		variables.jSoup		= new me.adamcameron.docs.JSoup().getJSoup();
		variables.docObject	= variables.jSoup.connect(variables.baseUrl & variables.pageName).get();

		return this;
	}

}