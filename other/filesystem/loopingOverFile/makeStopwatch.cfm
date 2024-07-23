<cfscript>
//makeStopwatch.cfm
struct function makeStopwatch(){
	var timeline		= [];

	var lap = function(string message=""){
		var ticksNow	= getTickCount();
		var lapCount	= arrayLen(timeline);
		var lap			= {
			currentClock	= ticksNow,
			lapDuration		= lapCount > 0 ? ticksNow - timeLine[lapCount].currentClock : 0,
			totalDuration	= lapCount > 0 ? ticksNow - timeLine[1].currentClock : 0,
			message			= message
		};
		arrayAppend(timeline, lap);
		return lap;
	};

	return {
		start		= function(string message="start"){
			return lap(message);
		},
		lap			= function(string message="lap"){
			return lap(message);
		},
		stop		= function(string message="stop"){
			return lap(message);
		},
		getTimeline	= function(){
			return timeLine;
		}
	};
};
</cfscript>