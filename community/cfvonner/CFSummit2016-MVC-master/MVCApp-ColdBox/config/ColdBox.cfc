component {
	
	function configure() {
		coldbox = {
			requestStartHandler	= "main.onRequestStart",
						
			// Dev settings only!
			reinitPassword		= '',
			customErrorTemplate = '/coldbox/system/includes/BugReport.cfm'
		};
		
		settings = {
			h1Title = 'CFSummit2016 MVC App',
            title = 'MVC Demo - ColdBox'
		};
	
		debugger = {
			debugMode=true
		};
		
	}
	
}