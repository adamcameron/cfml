<!--- testToString.cfm --->
<cfset rainbow = new ColourCollection(["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"])>
<cfoutput>
	Output: #rainbow#<br>
	len(): #len(rainbow)#<br>
	listLen(): #listLen(rainbow)#<br>
	ucase(): #ucase(rainbow)#<br>
</cfoutput>
