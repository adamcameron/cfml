<cfdirectory action="list" name="qDir" directory="#getDirectoryFromPath(getCurrentTemplatePath())#">

<cfquery name="qFilter" dbtype="query">
	select	*
	from	qDir
	where	DATELASTMODIFIED < <cfqueryparam value="#dateFormat(createDate(2006,11,1), 'dd/mm/yy')#" cfsqltype="cf_sql_date">
</cfquery>

<cfdump var="#qDir#" label="qDir">

<cfdump var="#qFilter#" label="qFilter">