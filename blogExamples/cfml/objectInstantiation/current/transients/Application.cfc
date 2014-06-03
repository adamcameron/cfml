// Application.cfc
component {

	variables.baseSubdir = listLast(getDirectoryFromPath(getBaseTemplatePath()), "\/");

	this.name = "#variables.baseSubdir#27";
	this.applicationTimeout = createTimespan(0,0,0,30);


	function onApplicationStart(){
		application.firstDependency = new FirstDependency();
		application.secondDependency = new SecondDependency();

		application.service = new Service(
			firstDependency = application.firstDependency,
			secondDependency = application.secondDependency
		);

		application.runtime = createObject("java","java.lang.Runtime").getRuntime();
		application.counter = createObject("java", "java.util.concurrent.atomic.AtomicInteger").init();

		application.baseGroup1 = createObject("Group1");
		application.baseGroup2 = createObject("Group2");
		application.baseGroup3 = createObject("Group3");
		application.baseGroup4 = createObject("Group4");


	}

	function onRequest(){
		var startTime	= getTickCount();
		var counter		= application.counter.incrementAndGet();
		var slowWarning	=  "";
		include arguments[1];
		var executionTime = getTickCount()-startTime;
		writeOutput("Execution time: #executionTime#ms");

		if (executionTime > URL.slowRequestThreshold){
			slowWarning = "SLOW REQUEST (above #URL.slowRequestThreshold#ms)";
		}
		writeLog(file="#this.name#", text="#executionTime#;#getFreeAllocatedMemory()#;#counter#;#slowWarning#");
	}

	function getFreeAllocatedMemory(){
		return application.runtime.freeMemory() / 1024^2;
	}

}