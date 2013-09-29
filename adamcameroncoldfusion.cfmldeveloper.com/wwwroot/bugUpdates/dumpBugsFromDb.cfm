<cfquery name="allBugs">
SELECT *
FROM	adobeBug
ORDER BY adobeId
</cfquery>
<cfoutput>#serializeJson(allBugs, true)#</cfoutput>