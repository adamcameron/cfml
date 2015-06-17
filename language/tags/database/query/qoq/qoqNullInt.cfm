<!--- 
Data being queried
<wddxPacket version='1.0'>
<header/>
<data>
	<recordset rowCount='10' fieldNames='PKCOL,TYPECOL,DATACOL' type='coldfusion.sql.QueryTable'>
		<field name='PKCOL'>
			<number>1.0</number>
			<number>2.0</number>
			<number>3.0</number>
			<number>4.0</number>
			<number>5.0</number>
			<number>6.0</number>
			<number>7.0</number>
			<number>8.0</number>
			<number>9.0</number>
			<number>10.0</number>
		</field>
		<field name='TYPECOL'>
			<string>nullData</string>
			<string>goodData</string>
			<string>nullData</string>
			<string>goodData</string>
			<string>nullData</string>
			<string>goodData</string>
			<string>nullData</string>
			<string>goodData</string>
			<string>nullData</string>
			<string>goodData</string>
		</field>
		<field name='DATACOL'>
			<null/>
			<number>1.0</number>
			<null/>
			<number>2.0</number>
			<null/>
			<number>3.0</number>
			<null/>
			<number>4.0</number>
			<null/>
			<number>5.0</number>
		</field>
	</recordset>
</data>
</wddxPacket>
 --->

<cfset dsn = "adam_junk">

<cfquery name="getGood" datasource="#dsn#">
	select	*
	from	table1
	where	typeCol = <cfqueryparam value="goodData" cfsqltype="CF_SQL_VARCHAR" maxlength="10">
</cfquery>

<cfquery name="getBad" datasource="#dsn#">
	select	*
	from	table1
	where	typeCol = <cfqueryparam value="nullData" cfsqltype="CF_SQL_VARCHAR" maxlength="10">
</cfquery>

<cfdump var="#getGood#">
<cfdump var="#getBad#">

<cfloop query="getBad">
	<cfset queryAddRow(getGood)>
	<cfset querySetCell(getGood, "pkCol", pkCol)>
	<cfset querySetCell(getGood, "TypeCol", TypeCol)>
	<cfset querySetCell(getGood, "dataCol", dataCol)>
</cfloop>

<cfdump var="#getGood#">
