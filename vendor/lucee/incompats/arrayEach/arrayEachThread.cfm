<cfscript>
cfflush(interval=16);
start = getTickCount();
trackIt("Begin Test");
threads = "";

elements = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth"];
elements.each(function(value, index, array){
	var threadName = "t#index#";
	threads = threads.listAppend(threadName);
	thread name=threadName value=value index=index array=array {
		trackIt("(#value#) start");
		var delay = (array.len() - index) * 1000;
		trackIt("(#value#) wating for #delay#ms");
		sleep(delay);
		trackIt("(#value#) end");
	}
});
thread action="join" name=threads;

trackIt("Test Complete");
end = getTickCount();
writeOutput("Total execution time: #end-start#ms<br>");

function trackIt(what){
	var when = dateTimeFormat(now(), "HH:MM:SS.LLL");
	var message = "(#when#) #what#";
	writeOutput("#message#<br>");
	writeLog(file="arrayEachThread", text=message);
}
</cfscript>