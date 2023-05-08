<cfquery name="colours">
SELECT id, en, mi
FROM colours
</cfquery>
<cfset jsonColours = serializeJson(colours)>
<cfdump var="#[colours,jsonColours]#">