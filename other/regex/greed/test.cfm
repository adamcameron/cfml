<cfscript>
	include "/scribble/shared/util/stopwatch.cfm";
	sw = makeStopWatch();

	text = fileRead(expandPath("./data.xml"));

	sw.start();
	greedy = reFindNoCase("<doc>.*</doc>", text, 1, true);
	sw.lap();
	lazy = reFindNoCase("<doc>.*?</doc>", text, 1, true);
	sw.stop();
	writeDump([len(text),greedy,lazy,sw.getTimeline()]);
</cfscript>