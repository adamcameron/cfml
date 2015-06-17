<cffunction name="getAncestors" output="false" returntype="query">
	<cfargument name="anl_id" type="Numeric" required="true">
	<cfset var q = false>

	<cfquery name="q" datasource="junk">
		select	anl_id, anl_left, anl_right, anl_name
		from	animals
		where	anl_left	<=	(select anl_left from animals where anl_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.anl_id#">)
		and		anl_right	>=	(select anl_right from animals where anl_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.anl_id#">)
		order by anl_left asc
	</cfquery>

	<cfreturn q>
</cffunction>

<!---
<cfdump var="#getAncestors(7)#" label="Bonobo">
<cfdump var="#getAncestors(8)#" label="Chimp">
<cfdump var="#getAncestors(10)#" label="Gorilla">
<cfdump var="#getAncestors(13)#" label="Gibbon">
<cfdump var="#getAncestors(16)#" label="Marmoset">
 --->

<!---<cftry>
	<cfcollection action="delete" collection="junk">
	<cfcatch>
		<!--- NOP --->
	</cfcatch>
</cftry>
<cfcollection action="create" collection="junk" path="C:\temp\" categories="true"> --->

<cfquery name="qData2Index" datasource="junk">
	select	*
	from	animals
</cfquery>

<cfset queryAddColumn(qData2Index, "anl_categories", arrayNew(1))>

<cfloop query="qData2Index">
	<cfset qAncestors = getAncestors(anl_id=anl_id)>
	<cfset querySetCell(qData2Index, "anl_categories", valueList(qAncestors.anl_name, "/"), currentRow)>
</cfloop>


<cfindex action="refresh" collection="junk" type="custom" key="anl_id" body="anl_name,anl_text" query="qData2Index" categorytree="anl_categories" category="anl_name" title="anl_name">

<cfdump var="#qData2Index#" expand="false">
<cfsearch collection="junk" name="qSearch" category="Chordata" status="stSearch" contextpassages="2">

<cfdump var="#qSearch#">