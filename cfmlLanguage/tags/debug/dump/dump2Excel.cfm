<cfquery name="q" datasource="intranet">
	select	*
	from app_globals
	order by app_global_id
</cfquery>
<cfcontent reset="true">
<cfheader name="Content-Disposition" value='inline; filename="#expandPath('./')#query.xls"'>
<cfcontent type="application/vnd.ms-excel" reset="true">
<cfdump var="#q#" expand="true" metainfo="false" format="text">
<cfabort>