<cfscript>
threads = "";
a = [1,2,3];
a.each(function(v){
	var t = "t#v#";
	threads = threads.listAppend(t);
	thread name=t {
		sleep(1000);
	}
});
thread action="join" name=threads;
</cfscript>