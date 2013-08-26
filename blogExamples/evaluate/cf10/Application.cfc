component {

	structAppend(this, {
		name				= "evaluatePerformance_#getTestName()#_#getSuffix()#",
		sessionManagement	= true
	});

	function onApplicationStart(){
		application.logName = this.name;

		// variables tests
		for (var i=1; i <= 10000; i++){
			application["variable#i#"] = i;
		}
		
		// method tests
		application.numbers = new methods.Numbers();
	}

	function onRequestStart(){
		if (!structKeyExists(application, "scopeCaches")){
			application.scopeCaches = {
				evaluate	= new cache.ScopeCacheEvaluate("application"),
				reference	= new cache.ScopeCacheReference("application")
			};
		}
	}


	function onRequest(){
		include arguments[1];
	}


	private string function getTestName(){
		var testFilePath	= getBaseTemplatePath();
		var test			= listLast(getDirectoryFromPath(testFilePath), "/\");
		var variation		= listFirst(getFileFromPath(testFilePath), ".");
		
		return "#test#_#variation#";
	}
	
	private string function getSuffix(){
		return numberFormat(timeFormat(now(), "HH") & minute(now()) \ 2,  "00");	// same suffix for 2min
	}
	
	private void function logIt(text){
		writeLog(file=application.logName, text=text);
	}

	
	// UDFs used by some tests
	function makeQuery(column, data){
		var q = queryNew("");
		queryAddColumn(q, "id", "integer", ids(arrayLen(data)));
		queryAddColumn(q, column, "varchar", data);
		return q;
	}

	function ids(numeric rows){
		var ids = [];
		for (var i=1; i <= rows; i++){
			arrayAppend(ids, i);
		}
		return ids;
	}
	
}