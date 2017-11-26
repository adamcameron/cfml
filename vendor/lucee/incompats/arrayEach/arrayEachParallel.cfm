<cfscript>
cfflush(interval=16);
start = getTickCount();
trackIt("Begin Test");

["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth"].each(function(value, index, array){
	trackIt("(#value#) start");
	var delay = (array.len() - index) * 1000;
	trackIt("(#value#) wating for #delay#ms");
	sleep(delay);
	trackIt("(#value#) end");
}, true);

trackIt("Test Complete");
end = getTickCount();
writeOutput("Total execution time: #end-start#ms<br>");

function trackIt(what){
	var when = dateTimeFormat(now(), "HH:MM:SS.LLL");
	var message = "(#when#) #what#";
	writeOutput("#message#<br>");
	writeLog(file="arrayEachParallel", text=message);
}
</cfscript>