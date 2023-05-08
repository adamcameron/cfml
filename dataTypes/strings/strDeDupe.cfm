Build
<cf_timeit>
<cfset sTest = "|,,,,,|">
<cfloop index="i" from="1" to="500">
	<cfset c = iif(randRange(0,1), de(chr(randRange(65,90))), de(lcase(chr(randRange(65,90)))))>
	<cfset sTest = sTest & c>
</cfloop>
</cf_timeit>
<!--- <cfoutput>#sTest#</cfoutput><br /><hr /> --->


removeDuplicates
<cf_timeit>
	<cfset s = removeDuplicates(sTest,true)>
</cf_timeit>
<cfoutput>#s#</cfoutput>



<cffunction name="removeDuplicates" access="remote" returntype="string" hint="Removes duplicates from a string, returning a list of each individual character." >
	<cfargument name="targetString" type="string" required="no" default="" hint="The string the remove duplicates from">
	<cfargument name="caseSensitive"	type="boolean" 	required="no"	default="false"	hint="Case sensitive character comparison. If false, the targetstring will be converted to upper case before processing happens">
	<cfscript>
	var sTarget 	= createObject("java","java.lang.String").init(arguments.targetString);
	var aChar 		= false;
	var setChars 	= createObject("java","java.util.TreeSet");
	
	if(not arguments.caseSensitive){
	sTarget 		= sTarget.toUpperCase();
	}
	aChar 			= sTarget.toCharArray();
	
	oObj = createObject("java", "java.lang.Character");
	aO = oObj.init(aChar);
	
	setChars.init(listToArray(arrayToList(aChar)));
	sTarget 		= arrayToList(setChars.toArray());
	return sTarget;
	</cfscript>
</cffunction>



