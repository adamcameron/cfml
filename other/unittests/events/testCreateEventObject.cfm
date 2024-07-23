<cfscript>
// testCreateEventObject.cfm
include "./function.cfm";

eventObject = createEventObject();
writeOutput("Before on() @ #ts()#<br>");
eventObject.on(
	"test",
	function(required struct event, required string triggeredAt){
		writeDump({onSetAt=event.data.ts, triggeredAt=triggeredAt});
	},
	{
		ts = ts()
	}
);
writeOutput("After on() @ #ts()#<br>");

sleep(3000);
writeOutput("Before trigger() @ #ts()#<br>");
eventObject.trigger(
	"test",
	{
		triggeredAt = ts()
	}
);
writeOutput("After trigger() @ #ts()#<br>");


function ts(){
	return  timeFormat(now(), "HH:MM:SS.LLL");
}
</cfscript>

