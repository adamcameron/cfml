<form name="x" method="post">
	<input type="text" name="Filter_1" id="Filter_1" value="1">
	<input type="text" name="Filter_2" id="Filter_1" value="2">
	<input type="text" name="Filter_3" id="Filter_1" value="3">
</form>
 
<cfset StructAppend(local,form) />
 
<cfloop index="loopCount" from="1" to="5">
	<cfif  isDefined('Filter_#loopCount#')>
		Do I exist?
	</cfif>
</cfloop>
 
<cfdump  var="#local#">