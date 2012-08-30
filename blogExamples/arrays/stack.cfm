<cfscript>
jobLog = "jobs2";

stack = [];

thread name="queueJobs" action="run" {
	for (i=1; i <= 10; i++){
		// we need to single-thread this...
		lock name="stack" type="exclusive" timeout=1 throwontimeout=true{
			jobName = "Job ###i#";
			arrayPrepend(stack, jobName);
		}
		writeLog(file=jobLog, text="#jobName# added");
		sleep(randRange(50,150));
	}
}

thread name="processJobs" action="run" {
	while (!arrayIsEmpty(stack)) {
		sleep(randRange(100,200));
		// ... because these two operations need to be atomic
		lock name="stack" type="exclusive" timeout=1 throwontimeout=true{
			job = stack[1];
			arrayDeleteAt(stack, 1);
		}
		writeLog(file=jobLog, text="#job# removed");
	}		
}

thread action="join" name="queueJobs,processJobs" {}	// wait here until the threads are done

writeDump(stack);	// demonstrate it's empty
</cfscript>