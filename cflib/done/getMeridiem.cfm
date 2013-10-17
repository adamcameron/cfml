<cffunction name="getMeridiem2" returntype="string" output="false">
	<cfargument name="timePassedIn" type="string" required="true">

	<cfset var meridiem = "" />

	<cfset arguments.timePassedIn = Trim( arguments.timePassedIn ) />
	<cfif not IsDate( arguments.timePassedIn )>
		<cfreturn meridiem />
	<cfelse>
		<cfset meridiem = TimeFormat( arguments.timePassedIn, "tt" ) />
	</cfif>

	<cfreturn meridiem>
</cffunction>

<cfscript>
string function getMeridiem(required date dateTime){
	return timeFormat(dateTime, "tt");
}



// test with date/times showing the cut-over from AM to PM
baseTS = createDateTime(year(now()), month(now()), day(now()), 11, 59, 55);
for (i=0; i <= 10; i++){
	testTs = dateAdd("s", i, baseTs);
	writeOutput("#testTs#: #getMeridiem(testTs)#<br />");
}

// test with a string
testTs = "17/2/1970 01:23:45";
writeOutput("#testTs#: #getMeridiem(testTs)#<br />");

</cfscript>