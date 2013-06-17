<cfflush interval="16">
<cfquery name="bugs">
	SELECT 		*
	FROM		AdobeBug
	ORDER BY	adobeId DESC
</cfquery>
<cfdump var="#bugs#" top="50" label="#bugs.recordCount#">