<cfcomponent output="false" hint="">


	<cffunction name="getData" returntype="query" access="private" output="false">
		<cfscript>
			var q = queryNew("id,name,sex,dob", "integer,varchar,varchar,date");
			queryAddRow(q); querySetCell(q, "id", 1); querySetCell(q, "name", "Adam");  querySetCell(q, "sex", "M"); querySetCell(q, "dob", createDate(1970,2,17));
			queryAddRow(q); querySetCell(q, "id", 2); querySetCell(q, "name", "Belinda");  querySetCell(q, "sex", "F"); querySetCell(q, "dob", createDate(1980,12,27));
			queryAddRow(q); querySetCell(q, "id", 3); querySetCell(q, "name", "Charlie");  querySetCell(q, "sex", "M"); querySetCell(q, "dob", createDate(1985,5,1));
			queryAddRow(q); querySetCell(q, "id", 4); querySetCell(q, "name", "Donna");  querySetCell(q, "sex", "F"); querySetCell(q, "dob", createDate(1990,4,22));
			queryAddRow(q); querySetCell(q, "id", 5); querySetCell(q, "name", "Eric");  querySetCell(q, "sex", "M"); querySetCell(q, "dob", createDate(1995,1,1));
			queryAddRow(q); querySetCell(q, "id", 6); querySetCell(q, "name", "Fleur");  querySetCell(q, "sex", "F"); querySetCell(q, "dob", createDate(2000,8,15));
			
			return q;
		</cfscript>
	
	</cffunction>


	<cffunction name="getOptions" returntype="query" access="remote" output="false" hint="">
		<cfset var qBase	= getData()>
		<cfset var qOptions	= false>

		<cfquery name="qOptions" dbtype="query">
			select		id as [value], name as display
			from		qBase
			order by	display
		</cfquery>

		<cfreturn qOptions>
	</cffunction>


	<cffunction name="getDetails" returntype="string" access="remote" output="false" hint="">
		<cfargument name="person" type="numeric" required="true">
		<cfset var q = getData()>
		<cfquery name="q" dbtype="query" maxrows="1">
			select	*
			from	q
			where	id	= <cfqueryparam value="#arguments.person#" cfsqltype="CF_SQL_INTEGER"> 
		</cfquery>
		<cfreturn "#q.id#|#q.name#|#q.sex#|#q.dob#">
	</cffunction>


</cfcomponent>