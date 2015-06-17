<cfquery name="people">
	SELECT * FROM person
</cfquery>
<cfdump var="#people#" label="People via SQL">