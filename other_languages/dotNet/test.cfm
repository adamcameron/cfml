<cfset oFile = createObject(".NET", "System.IO.Path")>
<cfdump var="#oFile#">
<cfset aChars = oFile.getInvalidFileNameChars()>
<cfloop index="i" from="1" to="#arrayLen(aChars)#">
<cfoutput>[#aChars[i].toString()#]<br /></cfoutput>
</cfloop>
<cfoutput>
#oFile.GetTempPath()#
</cfoutput>