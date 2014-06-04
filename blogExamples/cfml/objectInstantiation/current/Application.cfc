// Application.cfc
component {

	variables.baseSubdir = listLast(getDirectoryFromPath(getBaseTemplatePath()), "\/");

	this.name = "#variables.baseSubdir#23";
	this.applicationTimeout = createTimespan(0,0,0,30);


	function onApplicationStart(){
		application.firstDependency = new "#baseSubdir#.FirstDependency"();
		application.secondDependency = new "#baseSubdir#.SecondDependency"();

		application.service = new "#baseSubdir#.Service"(
			firstDependency = application.firstDependency,
			secondDependency = application.secondDependency
		);

		application.runtime = createObject("java","java.lang.Runtime").getRuntime();
		application.counter = createObject("java", "java.util.concurrent.atomic.AtomicInteger").init();
	}

	function onRequestStart(){
		param name="URL.slowRequestThreshold" default=10;
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