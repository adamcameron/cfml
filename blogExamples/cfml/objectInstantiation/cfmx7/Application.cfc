<!--- Application.cfc --->
<cfcomponent>
	
	<cfscript>
	variables.baseSubdir = listLast(getDirectoryFromPath(getBaseTemplatePath()), "\/");

	this.name = "#variables.baseSubdir#01";
	this.applicationTimeout = createTimespan(0,0,0,30);

	function onApplicationStart(){
		application.firstDependency = new "#baseSubdir#.FirstDependency"();
		application.secondDependency = new "#baseSubdir#.SecondDependency"();

		application.service = createObject("component", "#baseSubdir#.Service").init(
			firstDependency = application.firstDependency,
			secondDependency = application.secondDependency
		);

		application.runtime = createObject("java","java.lang.Runtime").getRuntime()
		application.counter = createObject("java", "java.util.concurrent.atomic.AtomicInteger").init();
	}

	function getFreeAllocatedMemory(){
		return application.oRuntime.freeMemory() / 1024^2;
	}
	</cfscript>

	<cffunction name="onRequest" output="true">
		<cfset var startTime = getTickCount()>
		<cfset var counter = application.counter.incrementAndGet()>
		<cfset var executionTime = 0>
		<cfset var slowWarning = "">
		<cfinclude template="#arguments[1]#">
		
		<cfset executionTime = getTickCount()-startTime>
		Execution time: #executionTime#ms

		<cfif executionTime GT 10>
			<cfset var slowWarning = "SLOW REQUEST">
		</cfif>
		<cflog file="#this.name#" text="executionTime=#executionTime#; freeMemory=#getFreeAllocatedMemory()#; count: #counter#;#slowWarning#")>
	</cffunction>

</cfcomponent>