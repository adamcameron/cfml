<cfscript>
	param name="URL.iterations" default=1;

	include "/shared/utils/makeStopwatch.cfm";

	baseText		= fileRead(expandPath("./text.dat"));
	//baseText		= "the quick brown fox jumps over the lazy dog";
	//baseText		= "Here's some text which we are going to try to find a chunk of, it's not very long, but it's just a test. I'm going to witter on for a bit just to give it some length.";
	textLength		= baseText.len();

	captureSize		= textLength \ 10;
	captureOffset	= captureSize * 2;

	aroundAll		= "<capture>#baseText#</capture>";
	atBeginning		= "<capture>#baseText.left(captureSize)#</capture>#baseText.right(baseText.len()-captureSize)#";
	atEnd			= "#baseText.left(textLength-captureSize)#<capture>#baseText.right(captureSize)#</capture>";

	prefix			= baseText.left(captureOffset);
	captureChunk	= baseText.mid(captureOffset+1, captureSize);
	suffix			= baseText.right(textLength - (captureOffset + captureSize));
	nearBeginning	= "#prefix#<capture>#captureChunk#</capture>#suffix#";

	prefixOffset	= textLength - (captureOffset + captureSize);
	prefix			= baseText.left(prefixOffset);
	captureChunk	= baseText.mid(prefixOffset+1, captureSize);
	suffix			= baseText.right(captureOffset);
	nearEnd			= "#prefix#<capture>#captureChunk#</capture>#suffix#";

	greedy			= "<capture>.*</capture>";
	lazy			= "<capture>.*?</capture>";

	function test(job){
		stopWatch = makeStopwatch();
		stopWatch.start();
		for (var i=1; i <= URL.iterations; i++){
			job();
		}
		stopWatch.stop();
		return stopWatch.getTimeline()[2].totalDuration;
	};

	writeOutput("Iterations: #URL.iterations#<hr>");

	if (baseText.len() <= 1000){
		writeDump(var=[
			{aroundAll=aroundAll},
			{atBeginning=atBeginning},
			{atEnd=atEnd},
			{nearBeginning=nearBeginning},
			{nearEnd=nearEnd}
		], expand=false);
	}

	writeDump(var=[
		{textLength		= textLength},
		{captureSize	= captureSize},
		{captureOffset	= captureOffset}
	], expand=false);

	writeOutput("<h4>control</h4>");
	controlResult = test(function(){});
	writeOutput("control: #controlResult#<br>");
	writeOutput("<hr>");

	writeOutput("<h4>allAround</h4>");
	greedyResult = test(function(){aroundAll.reFind(greedy);});
	lazyResult = test(function(){aroundAll.reFind(lazy);});
	writeOutput("greedy: #greedyResult#<br>");
	writeOutput("lazy: #lazyResult#<br>");
	writeOutput("<hr>");

	writeOutput("<h4>atBeginning</h4>");
	greedyResult = test(function(){atBeginning.reFind(greedy);});
	lazyResult = test(function(){atBeginning.reFind(lazy);});
	writeOutput("greedy: #greedyResult#<br>");
	writeOutput("lazy: #lazyResult#<br>");
	writeOutput("<hr>");

	writeOutput("<h4>atEnd</h4>");
	greedyResult = test(function(){atEnd.reFind(greedy);});
	lazyResult = test(function(){atEnd.reFind(lazy);});
	writeOutput("greedy: #greedyResult#<br>");
	writeOutput("lazy: #lazyResult#<br>");
	writeOutput("<hr>");

	writeOutput("<h4>nearBeginning</h4>");
	greedyResult = test(function(){nearBeginning.reFind(greedy);});
	lazyResult = test(function(){nearBeginning.reFind(lazy);});
	writeOutput("greedy: #greedyResult#<br>");
	writeOutput("lazy: #lazyResult#<br>");
	writeOutput("<hr>");

	writeOutput("<h4>nearEnd</h4>");
	greedyResult = test(function(){nearEnd.reFind(greedy);});
	lazyResult = test(function(){nearEnd.reFind(lazy);});
	writeOutput("greedy: #greedyResult#<br>");
	writeOutput("lazy: #lazyResult#<br>");
	writeOutput("<hr>");

</cfscript>