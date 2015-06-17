<cfscript>
// returnAReference.cfm
public Thing function getTheThing(required string typeOfThing, string telemetryVariableName){
	variables[telemetryVariableName] = {status="OK", something="else"};
	return new Thing(typeOfThing);
}

thing = getTheThing("badger", "variableForTelemetry");
writeDump([thing, variableForTelemetry]);
writeOutput("<hr>");


public Thing function getTheOtherThing(required string typeOfThing, struct telemetry){
	structAppend(telemetry, {status="OK", something="else"});
	return new Thing(typeOfThing);
}

telemetryVariable = {};
otherThing = getTheOtherThing("parsnip", telemetryVariable);
writeDump([otherThing,telemetryVariable]);
writeOutput("<hr>");
</cfscript>