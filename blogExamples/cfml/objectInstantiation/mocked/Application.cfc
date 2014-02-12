// Application.cfc
component {

	variables.baseSubdir = listLast(getDirectoryFromPath(getBaseTemplatePath()), "\/");

	this.name = "#variables.baseSubdir#13";
	this.applicationTimeout = createTimespan(0,0,0,30);


	function onApplicationStart(){
		application.firstDependency = new "#baseSubdir#.FirstDependency"();
		application.secondDependency = new "#baseSubdir#.SecondDependency"();

		application.service = new "#baseSubdir#.Service"(
			firstDependency = application.firstDependency,
			secondDependency = application.secondDependency
		);

		application.memoryUsage = new core.util.memory.MemoryUsage();
		application.counter = createObject("java", "java.util.concurrent.atomic.AtomicInteger").init();;
	}

	function onRequest(){
		var startTime = getTickCount();
		var counter = application.counter.incrementAndGet();
		include arguments[1];
		var executionTime = getTickCount()-startTime;
		writeOutput("Execution time: #executionTime#ms");

		writeLog(file=this.name, text="executionTime=#executionTime#; freeMemory=#application.memoryUsage.getMemoryUsage().fltFreeAllocated#; count: #counter#;#executionTime GT 10?'SLOW REQUEST':''#");
	}

}