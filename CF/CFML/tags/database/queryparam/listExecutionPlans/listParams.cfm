<cfflush interval="64">
<cfparam name="URL.minLen" default="1" type="integer">
<cfparam name="URL.maxLen" default="10" type="integer">
<cfparam name="URL.tests" default="10" type="integer">

Start<br />
<cfoutput>Using lists between #URL.minLen# and #URL.maxLen# IDs<br /></cfoutput>
<cfloop index="iLen" from="#URL.minLen#" to="#URL.maxLen#">
	Length of list: <cfoutput>#iLen#</cfoutput><br />
	<cfloop index="i" from="1" to="#URL.tests#">
		<cfset lIds = "">
		<cfloop condition="listLen(lIds) lt iLen">
			<cfset iRand = randRange(1, 10000)>
			<cfif not listFind(lIds, iRand)>
				<cfset lIds = listAppend(lIds, iRand)>
			</cfif>
		</cfloop>
		<cf_timeit>
		<cfquery name="q" datasource="mysite">
			select	*
			from	tbl_loremipsum
			where	lor_id in (<cfqueryparam value="#lIds#" cfsqltype="cf_sql_integer" list="true">)
		</cfquery>
		</cf_timeit>
		<!--- <cfdump var="#st#"> --->
	</cfloop>
</cfloop>

