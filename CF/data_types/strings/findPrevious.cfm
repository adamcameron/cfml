<cffunction name="findPrevious" output="true" returntype="string">
	<cfargument name="str" type="string" required="yes" hint="String to look in.">
	<cfargument name="sub" type="string" required="yes" hint="String to look for.">
	<cfargument name="pos" type="numeric" required="yes" hint="Place to start looking back from.">
	
	<cfset var trimmedStr = lcase(left(arguments.str, arguments.pos))>
	<cfset var matchPos = trimmedStr.lastIndexOf(lcase(arguments.sub), arguments.pos)+1><!--- Offset because Java is zero-indexed, and CF is one-indexed --->
	<cfreturn matchPos>
</cffunction>
<cfset testStr = 'The quick brown fox jumps over the lazy dog'>
<cfset match = findPrevious(testStr, 'the', 10)>

<cfoutput>
	#mid(testStr, match, 10)#
</cfoutput>