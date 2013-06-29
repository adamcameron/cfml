<cfflush interval="16">
<cfquery name="bugs">
	SELECT 		*
	FROM		AdobeBug
	ORDER BY	votes DESC
</cfquery>
<cfdump var="#bugs#" top="50" label="#bugs.recordCount#">