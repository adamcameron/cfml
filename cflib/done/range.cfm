<cffunction name="getRangeOriginal" access="public" returntype="any"  >
	<cfargument name="subgroup" type="string"  required="yes" hint="this is the array that will hold the samples">
	<cfset Range = 0>
	<cfset samples = ListToArray(ARGUMENTS.subgroup,',')>
	<cfif IsArray(samples)>
		<cfif NOT ArrayIsEmpty(samples)>
			<cfset Range = ArrayMax(samples) - ArrayMin(samples) >
		<cfelse>
			<cfabort showerror="ERROR: SUBGROUP IS EMPTY">
		</cfif>
	<cfelse>
		<cfabort showerror="xxx">
	</cfif>

	<cfreturn Range>
</cffunction>

<cfscript>
numeric function getRange(required array samples){
	if (arrayIsEmpty(arguments.samples)){
		throw(type="IllegalArgumentException", message="sample argument is empty", detail="The sample array must contain at least one element");
	}
	return arrayMax(arguments.samples) - arrayMin(arguments.samples);
}


a = [1,2,3,4,5,6,1,2,4,45,5,6,89,7,7,8,12,8,99,7,7,8,8,8];

try{
	writeOutput("getRangeOriginal(): #getRangeOriginal(arrayToList(a))#<br>");
}
catch (any e){
	writeOutput("getRangeOriginal()<br>");
	writeDump([e.type,e.message,e.detail]);
}
try{

	writeOutput("getRange(): #getRange(a)#<br>");
}
catch (any e){
	writeOutput("getRange()<br>");
	writeDump([e.type,e.message,e.detail]);
}
</cfscript>
<cfset samples = [1,2,3,4,5,6,1,2,4,45,5,6,89,7,7,8,12,8,99,7,7,8,8,8]>
<cfset range = getRange(samples)>
<cfoutput>#range#</cfoutput>