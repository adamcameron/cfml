<cfparam name="URL.count" default="100" type="integer">

<cfflush interval="128">

<cffunction name="randString" output="false" returntype="string">
	<cfargument name="length" type="numeric" required="true">
	<cfscript>
		var i = 0;
		var c = "";
		var s = "";

		for (i=1; i le arguments.length; i=i+1){
			s = s & chr(randRange(97, 122));
			if (randRange(1, 5) eq 1){
				s = s & " ";
				i=i+1;
			}
		}
		return left(s, arguments.length);
	</cfscript>
</cffunction>

<cf_timeit>
	<cfquery name="qTop" datasource="uhweb">
		select	max(qoq_id) as max_id
		from	tbl_test_qoq
	</cfquery>
	<cfif len(qTop.max_id[1])>
		<cfset iStart = qTop.max_id[1] + 1>
	<cfelse>
		<cfset iStart = 1>
	</cfif>

	<cfloop index="i" from="#iStart#" to="#iStart + URL.count#">
		<cfquery datasource="uhweb">
			insert into tbl_test_qoq (
				qoq_id, qoq_data
			) values (
				<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">, <cfqueryparam value="#randString(length=4000)#" cfsqltype="cf_sql_varchar">
			)
		</cfquery>
	</cfloop>
</cf_timeit>



