<cfscript>
// useStopwatch.cfm
include "makeStopwatch.cfm";
stopwatch = makeStopwatch();

stopwatch.start("Begin timing");
sleep(500);
stopwatch.lap();
sleep(1500);
secondLap = stopwatch.lap("after another 1500ms");
writeDump(var=secondLap, label="secondLap");
sleep(2000);
stopwatch.start("Stop timing");
writeDump(var=stopWatch.getTimeline());
</cfscript>