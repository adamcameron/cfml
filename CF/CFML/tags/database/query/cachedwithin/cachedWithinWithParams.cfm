<cfquery name="q" datasource="scratch" cachedwithin="#createTimespan(0,0,0,30)#" result="st">
select	*
from	Post
where	IDPost <= <cfqueryparam value="5" cfsqltype="cf_sql_integer">
</cfquery>

<cfdump var="#variables#">