<cfparam name="URL.low" type="integer" default="0">
<cfparam name="URL.high" type="integer" default="0">

<cfset params = [
	{value=URL.low},
	{value=URL.high}
]>
<cfquery name="numbersViaPositionalParams" datasource="scratch_mssql" params="#params#">
	SELECT	en AS english, mi AS maori
	FROM	colours
	WHERE	id	BETWEEN ? AND ?
</cfquery>
<cfdump var="#numbersViaPositionalParams#">
<br><br><br>

<cfset params = {
	low=URL.low,
	high=URL.high
}>
<cfquery name="numbersViaNamedParams" datasource="scratch_mssql" params="#params#">
	SELECT	en AS english, mi AS maori
	FROM	colours
	WHERE	id	BETWEEN :low AND :high
</cfquery>
<cfdump var="#numbersViaNamedParams#" label="via &lt;cfquery&gt;">
<br><br><br>