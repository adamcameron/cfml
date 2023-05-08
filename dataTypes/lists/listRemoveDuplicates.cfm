<cffunction access="remote" name="listRemoveDuplicates" output="yes" returntype="string" hint="Removes all duplicates from a list">
	<cfargument name="list"			type="string" required="yes"			hint="List to search.">
	<cfargument name="delimiters"	type="string" required="no"	default=","	hint="Set of delimiters used in the list.">
	<cfscript>
		var listValue = "";
		var keyStruct = structNew();
	</cfscript>	
	<cfloop index="listValue" list="#arguments.list#" delimiters="#arguments.delimiters#">
		<cfset keyStruct[listValue] = "">
	</cfloop>
	<cfreturn structKeyList(keyStruct,arguments.delimiters)>
</cffunction>

<cfset myList = "one\two/three|four/five|six\seven-one\two/three|four/five|six\seven-one\two/three|four/five|six\seven-one\two/three|four/five|six\seven">
<cfset delims = "/\-|">

<cfdump var='#listRemoveDuplicates(myList, delims)#'>
<br />
<cfdump var='#listInsertAt(myList, 2, "eight", delims)#'>

<cfdump var="#listToArray(myList, delims)#">