<cfset VARIABLES.array1 = ArrayNew(1)>											<!--- Array --->
<cfset ArrayAppend(VARIABLES.array1, "Original1")>
<cfset ArrayAppend(VARIABLES.array1, "Original2")>

<cfmodule template="Test.cfm" SomeArray="#VARIABLES.array1#">

<cfoutput>
	#VARIABLES.array1[1]#<br />
	#VARIABLES.array1[2]#<br />
</cfoutput>