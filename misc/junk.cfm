<cfscript>
	public struct function getTheThings(required string someArgument, string telemetryVariableName){
		variables[telemetryVariableName] = {flag="value", status="OK", something="else"};
		return {thing1="this #someArgument#", thing2="that #someArgument#"};
	}

	things = getTheThings("thing", "variableForTelemetry");
	writeDump([things, variableForTelemetry]);
	writeOutput("<hr>");


	public struct function getTheOtherThings(required string someArgument, struct telemetry){
		structAppend(telemetry, {flag="value", status="OK", something="else"});
		return {thing1="this #someArgument#", thing2="that #someArgument#"};
	}
	telemetryVariable = {};
	otherThings = getTheOtherThings("fish", telemetryVariable);
	writeDump([otherThings,telemetryVariable]);
	writeOutput("<hr>");
</cfscript>