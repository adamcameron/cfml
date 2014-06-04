<!--- Application.cfc --->
<cfcomponent>
	
	<cfscript>
	variables.baseSubdir = listLast(getDirectoryFromPath(getBaseTemplatePath()), "\/");

	this.name = "#variables.baseSubdir#23";
	this.applicationTimeout = createTimespan(0,0,0,30);

	function onApplicationStart(){
		application.firstDependency = createObject("component", "#baseSubdir#.FirstDependency").init();
		application.secondDependency = createObject("component", "#baseSubdir#.SecondDependency").init();

		application.service = createObject("component", "#baseSubdir#.Service").init(
			firstDependency = application.firstDependency,
			secondDependency = application.secondDependency
		);

		application.runtime = createObject("java","java.lang.Runtime").getRuntime();
		application.counter = 0;
	}

	function getFreeAllocatedMemory(){
		return application.runtime.freeMemory() / 1024^2;
	}
	</cfscript>

	<cffunction name="onRequestStart" output="false">
		<cfparam name="URL.slowRequestThreshold" default="10">
	</cffunction>

	<cffunction name="onRequest" output="true">
		<cfset var startTime = getTickCount()>
		<cfset var executionTime = 0>
		<cfset var slowWarning = "">
		<cfset var counter = 0>
		<cfinclude template="#arguments[1]#">
		
		<cfset executionTime = getTickCount()-startTime>
		Execution time: #executionTime#ms

		<cfif executionTime GT URL.slowRequestThreshold>
			<cfset slowWarning = "SLOW REQUEST (above #URL.slowRequestThreshold#ms)">
		</cfif>
		<cflock scope="application" timeout="1" throwontimeout="true">
			<cfset application.counter 	= application.counter + 1>
			<cfset counter 				= application.counter>
			<cfset logText				= "#executionTime#;#getFreeAllocatedMemory()#;#counter#;#slowWarning#">
		</cflock>
		<cflog file="#this.name#" text="#logText#">
	</cffunction>

</cfcomponent>