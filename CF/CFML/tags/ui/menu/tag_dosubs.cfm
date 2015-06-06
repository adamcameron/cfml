<cfparam name="attributes.menuData" type="query">
<cfparam name="attributes.parentId" type="numeric">

<cfset menuData = attributes.menuData>
<cfquery name="qSubs" dbtype="query">
	select		id, parentId, label
	from		menuData
	where		parentId	= <cfqueryparam value="#attributes.parentId#" cfsqltype="cf_sql_integer">
	order by	id
</cfquery>
<cfloop query="qSubs">
	<cfmenuitem display="#label#" href="#CGI.script_name#?id=#id#" name="sub_#parentId#_#id#">
		<cf_tag_dosubs menuData="#attributes.menuData#" parentId="#id#">
	</cfmenuitem>
</cfloop>
