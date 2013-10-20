// Application.cfc
component {

	this.name = "testEvent01";

	function onApplicationStart(){
		application.event = new Event();
		application.pageRouter = new PageRouter();

		application.event.on("pageRequested", application.pageRouter.pageRequestHandler);
	}

	function onRequestStart(){
		application.event.trigger("pageRequested", {URL=URL, form=form, CGI=CGI});
	}
	
}