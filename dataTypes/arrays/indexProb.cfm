<cfset application.a2DArray = ArrayNew(2)>
<cfset application.a2DArray[1][1] = "data11">
<cfset application.a2DArray[1][2] = "data12">
<cfset application.a2DArray[2][1] = "data21">
<cfset application.a2DArray[2][2] = "data22">

<!--- Dump array with 2 x 2 elements --->
<cfdump label="application.a2DArray" var="#application.a2DArray#">

<cftry>
	<cfif application.a2DArray[4][2] eq "something">
		You would expect this to generate an error but not to change the array size
	</cfif>
	<cfcatch type="Any">
		<cfoutput>#cfcatch.message#</cfoutput>
	</cfcatch>
</cftry>

<!--- Array now has with 2 x 2 two elements plus 2 new empty elements --->
<cfdump label="application.a2DArray" var="#application.a2DArray#">

<cfset application.a2DArray = ArrayNew(1)>
<cfset application.a2DArray[1] = "data11">
<cfset application.a2DArray[2] = "data12">

<!--- Dump array with 2 x 2 elements --->
<cfdump label="application.a2DArray" var="#application.a2DArray#">

<cftry>
	<cfif application.a2DArray[4] eq "something">
		You would expect this to generate an error but not to change the array size
	</cfif>
	<cfcatch type="Any">
		<cfoutput>#cfcatch.message#</cfoutput>
	</cfcatch>
</cftry>

<!--- Array now has with 2 x 2 two elements plus 2 new empty elements --->
<cfdump label="application.a2DArray" var="#application.a2DArray#">