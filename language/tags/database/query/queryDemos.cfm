<cfparam name="URL.low" type="integer" default="0">
<cfparam name="URL.high" type="integer" default="0">

<cfquery name="coloursViaCfquery" datasource="scratch_mssql">
	SELECT	en AS english, mi AS maori
	FROM	colours
	WHERE	id	BETWEEN	<cfqueryparam value="#URL.low#">
				AND		<cfqueryparam value="#URL.high#">
</cfquery>
<!---
<cfdump var="#coloursViaCfquery#" label="via &lt;cfquery&gt;">
<br><br><br>
<cfscript>
queryService = new Query();
queryService.setSql("
	SELECT	en AS english, mi AS maori
	FROM	colours
	WHERE	id	BETWEEN	:low
				AND		:high
");
queryService.setDataSource("scratch_mssql");
queryService.addParam(name="low", value=URL.low);
queryService.addParam(name="high", value=URL.high);
queryResult = queryService.execute();
coloursViaQueryCfc = queryResult.getResult();

writeDump(var=coloursViaQueryCfc, label="via Query.cfc");
</cfscript>
<br><br><br>
--->
<cfscript>
coloursViaQueryCfcShorthand = new Query(
	datasource	= "scratch_mssql",
	parameters	= [
		{name="low", value=URL.low},
		{name="high", value=URL.high}
	],
	sql			= "
		SELECT	en AS english, mi AS maori
		FROM	colours
		WHERE	id	BETWEEN	:low
					AND		:high
	"
).execute().getResult();

writeDump(var=coloursViaQueryCfcShorthand, label="via Query.cfc (shorthand)");

queryService = new Query(
	datasource	= "scratch_mssql",
	sql			= "
		SELECT	en AS english, mi AS maori
		FROM	colours
		WHERE	id	BETWEEN	:low
					AND		:high
	"
);
queryService.setAttributes(parameters=[
	{name="low", value=URL.low},
	{name="high", value=URL.high}
]);
paramsViaSetter = queryService.execute().getResult();

writeDump(var=paramsViaSetter, label="via setParameters()");



</cfscript>
<!---

<br><br><br><cfscript>
coloursViaQueryExecute = queryExecute("
	SELECT	en AS english, mi AS maori
	FROM	colours
	WHERE	id	BETWEEN	:low
				AND		:high
	",
	{low=URL.low, high=URL.high},
	{datasource="scratch_mssql"}
);

writeDump(var=coloursViaQueryExecute, label="via Query.cfc (shorthand)");
</cfscript>
<br><br><br>
<cfset params = [
	{value=URL.low},
	{value=URL.high}
]>
<cfquery name="coloursViaCfqueryRailo" datasource="scratch_mssql">
	SELECT	en AS english, mi AS maori
	FROM	colours
	WHERE	id	BETWEEN ? AND ?
</cfquery>
<cfdump var="#coloursViaCfqueryRailo#" label="via &lt;cfquery&gt;">
<br><br><br--->