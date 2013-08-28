<cfcomponent>
<cfscript>
	this.name				= "evaluatePerformance_#getTestName()#_#getSuffix()#";
	this.sessionManagement	= true;

	function onApplicationStart(){
		var i = 0;
		application.logName = this.name;

		// variables tests
		for (i=1; i LE 10000; i=i+1){
			application["variable#i#"] = i;
		}
		
		// method tests
		application.numbers = createObject("component", "methods.Numbers");
	}

	function onRequestStart(){
		if (not structKeyExists(application, "scopeCaches")){
			application.scopeCaches = structNew();
			application.scopeCaches.evaluate	= createObject("component", "cache.ScopeCacheEvaluate").init("application");
			application.scopeCaches.reference	= createObject("component", "cache.ScopeCacheReference").init("application");
		}
	}
</cfscript>

	<cffunction name="onRequest">
		<cfinclude template="#arguments[1]#">
	</cffunction>
	<cffunction name="logIt">
		<cfargument name="text">
		<cflog file="#application.logName#" text="#text#">
	</cffunction>


<cfscript>
	function getTestName(){
		var testFilePath	= getBaseTemplatePath();
		var test			= listLast(getDirectoryFromPath(testFilePath), "/\");
		var variation		= listFirst(getFileFromPath(testFilePath), ".");
		
		return "#test#_#variation#";
	}
	
	function getSuffix(){
		return numberFormat(timeFormat(now(), "HH") & minute(now()) \ 2,  "00");	// same suffix for 2min
	}
	
	// UDFs used by some tests
	function makeQuery(column, data){
		var q = queryNew("");
		queryAddColumn(q, "id", "integer", ids(arrayLen(data)));
		queryAddColumn(q, column, "varchar", data);
		return q;
	}

	function ids(rows){
		var ids = arrayNew(1);
		var i	= 0;
		for (i=1; i LE rows; i=i+1){
			arrayAppend(ids, i);
		}
		return ids;
	}
</cfscript>	
</cfcomponent>