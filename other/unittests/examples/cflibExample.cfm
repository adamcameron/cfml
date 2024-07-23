<cfscript>
// cflibExample.cfm
include "../events/function.cfm";

event = createEventObject();

event.on("TestEvent", function(){writeOutput("Hello World<br>");});
event.trigger("TestEvent");


event.on(
	"AnotherEvent", function(event, name){
		writeOutput("#event.data.greeting#, #name#<br>");
	},
	{greeting="G'day"}
);
event.trigger("AnotherEvent", {name="Zachary"});

</cfscript>