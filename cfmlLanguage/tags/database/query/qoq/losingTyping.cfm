<cfset qTest = queryNew('')>
<!---<cfset queryAddColumn(qTest, "column1", listToArray('1.10'))> --->
<cfset queryAddColumn(qTest, "column1", "varchar", listToArray('1.10,2.20,10.10'))>
<cfdump var="#qTest#" label="Init">

<cfquery name="qTest" dbtype="query">
SELECT * FROM qTest ORDER BY column1
</cfquery>
<cfdump var="#qTest#" label="Ordered">

<cfset qTest = queryNew('')>
<cfset queryAddColumn(qTest, "column1", "varchar", listToArray('1.10,2.20,10.10'))>
<cfdump var="#qTest#" label="After queryAddColumn()">

<cfset queryAddRow(qTest)>
<cfdump var="#qTest#" label="After queryAddRow()">

<cfset querySetCell(qTest,"column1","3.30")>
<cfdump var="#qTest#" label="After querySetCell()">

<cfquery name="qTest" dbtype="query">
SELECT cast(column1 as varchar) as column1
FROM qTest
ORDER BY column1
</cfquery>
<cfdump var="#qTest#" label="after QoQ">
