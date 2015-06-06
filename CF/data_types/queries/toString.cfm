<cf_timeit>
<cfquery name="q1" datasource="intranet">
	select	*
	from	tbl_objtree
</cfquery>
</cf_timeit>

<cf_timeit>
	<cfoutput>#q1.toString()#<br /></cfoutput>
</cf_timeit>
<hr />

<cf_timeit>
<cfquery name="q2" datasource="intranet">
	select	*
	from	tbl_objtree
	order by	obt_left desc
</cfquery>
</cf_timeit>

<cf_timeit>
	<cfoutput>#q2.toString()#<br /></cfoutput>
</cf_timeit>
<hr />

<cf_timeit>
<cfquery name="q3" datasource="intranet">
	select	*
	from	tbl_objtree
	order by	obt_left desc
</cfquery>
</cf_timeit>

<cf_timeit>
	<cfoutput>#q3.toString()#<br /></cfoutput>
</cf_timeit>
<hr />

<cf_timeit>
<cfset q4 = q3>
</cf_timeit>

<cf_timeit>
	<cfoutput>#q4.toString()#<br /></cfoutput>
</cf_timeit>
<hr />

<cf_timeit>
<cfset serialiseQuery(q=q1)>
<br />
</cf_timeit>
<hr />

<cf_timeit>
<cfset serialiseQuery(q=q2)>
<br />
</cf_timeit>
<hr />

<cf_timeit>
<cfset serialiseQuery(q=q3)>
<br />
</cf_timeit>
<hr />

<cf_timeit>
<cfset serialiseQuery(q=q3)>
<br />
</cf_timeit>
<hr />


<cffunction name="serialiseQuery" returntype="void" output="true">
	<cfargument name="q" type="query" required="true">

	<cfset var sColName = "">

	<cfloop index="sColname" list="#arguments.q.columnList#">
		<cfoutput>#arguments.q[sColname].toString()#<br /></cfoutput>
	</cfloop>
	<cfreturn>
</cffunction>