<cfset dsn = "adam_junk">


<cfquery name="getGood" datasource="#dsn#">
	select		*
	from		table1
	order by	pkCol
</cfquery>

<cfwddx action="cfml2wddx" input="#getGood#" output="wddxData" usetimezoneinfo="no">
<cffile action="write" addnewline="no" file="C:\blackstone\wwwroot\adam_junk\queries\sample.xml" output="#wddxData#">