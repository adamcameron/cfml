<!--- 2. INDEX PRESIDE ASSETS --->
<cfset fileTableName= "file">
<cfif lcase(request.dbtype) eq "mssql">
	<cfset fileTableName= "[file]">
</cfif>


<cfquery name="qGetDocs" datasource="#request.dsn#">
<!--- 	select fTable.fileid, fTable.Name, fVersions.filepath, fVersions.fileVersionNumber
	from #fileTableName# as fTable inner join  fileversions as fVersions
		on		fTable.activeversionid = fVersions.fileversionid
		where (fVersions.filepath like '%.pdf')
		 --->
<!--- ,
	CONCAT(v.fileVersionNumber, ' ') AS fileVersionNumber --->
SELECT
	f.fileID,
	f.Name, 
	v.filepath,
	f.datepublished AS datepublished,
	b.obj_label AS doctype
FROM
	#fileTableName# AS f
JOIN
	filelinkcategories AS l
	ON
	l.fileID = f.fileID
JOIN
	fileversions AS v
	ON
	v.fileVersionID = f.activeVersionID
JOIN
	relatedobjects r
	ON (
		r.sourceObjectID = f.fileID
		AND
		r.targetObjectType = 'briefing'
	)
JOIN
	pobj_briefing b
	ON (
		b.obj_ID = r.targetObjectID
	)
WHERE v.filepath NOT LIKE '%recycle_bin%'

ORDER BY
	datepublished DESC
</cfquery>


<cfquery datasource="#request.dsn#" name="qFiles">
	SELECT * FROM fileversions;
</cfquery> 

<cfcollection action="LIST" name="qCollections">
<cfquery dbtype="query" name="qFilterCollections">
	SELECT * FROM qCollections WHERE name='aoc-briefing-docs'
</cfquery>

<!--- <cfdump var="#qFilterCollections#"> --->
<!--- if it doesnt already exist then create my collection --->
<cfif not qFilterCollections.recordcount>
	<cfcollection collection="aoc-briefing-docs" action="create" path="#request.sitepath#/collections">
	<p>Collection created , please run again to index this collection.</p>
<cfelse>
	<cfindex action="purge" collection="aoc-briefing-docs">

	<!--- CW: urlpath is not needed, it will be generated on the fly (in template) --->
	<cfset qDocIndexTable = querynew("name,directory,path_rel,datelastmodified,fileid,briefing")>

	<table border=1 cellpadding="0" cellspacing="0">
		<tr style="background: #AFAFAF;">
			<th>No.</th><th>Name</th><th>File Path</th><!--- <th>File Version</th> --->
			<th>File ID</th><th>Briefing type</th></tr>
		<cfset bFlag= true>
		<cfset sStyle = "background: ##EFECD1">
		<cfloop query="qGetDocs" index="#iNumbering#" endrow="3">
			<cfset sPathToFile = "#request.sitepath#filemanager/#filepath#">
			<cfset sPathToFile = ReplaceNoCase(sPathToFile,"/","\","all")>
			<cfif fileexists(sPathToFile)>
				<cfset queryaddrow(qDocIndexTable)>
				<cfset querySetCell(qDocIndexTable, "name", Name)>
				
				<cfset querySetCell(qDocIndexTable, "directory", "#sPathToFile#")>
				<cfset querySetCell(qDocIndexTable, "path_rel", "http://aoc.vmnet.pixl8.co.uk/filemanager/#qGetDocs.filepath#")>
				<!--- <cfset querySetCell(qDocIndexTable, "urlpath", "#request.websitepath#downlod.cfm?docid=#qGetDocs.fileid#")> --->
				<cfset querySetCell(qDocIndexTable, "datelastmodified", DateFormat(qGetDocs.datepublished, "yyyy-mm-dd") )>
				<cfset querySetCell(qDocIndexTable, "fileid", qGetDocs.fileid & ";" & qGetDocs.doctype)>
				<cfset querySetCell(qDocIndexTable, "briefing", qGetDocs.doctype)>

<!--- 	name	size	type	directory	datelastmodified	attributes	mode	u	fullpath	thisrow --->
	
				<cfoutput>
				<tr <cfif bFlag>style="#sStyle#"</cfif>>
					<td>
						#qGetDocs.currentRow#
					</td>
					<td>
						#name#
					</td>
					<td>
						#sPathToFile#
					</td>
					<!--- <td>
						#qGetDocs.fileVersionNumber#
					</td> --->
					<td>#qGetDocs.fileid#</td>
					
					<td>#qGetDocs.doctype#</td>
					
				</tr>
				</cfoutput>
				<cfset bFlag = not bFlag>
		 		<cfflush>
			</cfif>
		</cfloop>
	</table>
	 <cfdump var="#qDocIndexTable#"> path_rel 
	</cfif>
	
<cfindex action="refresh" collection="aoc-briefing-docs" query="qDocIndexTable" type="file" key="directory" custom1="datelastmodified" custom2="fileid" custom3="briefing" status="stIndex">
<!--- <cfindex action="refresh" collection="testBd" query="qListing" type="file" key="fullPath" custom1="u" custom2="type" custom3="thisRow" custom4="size" status="stIndex"> --->
<cfdump var="#stIndex#">

<cfsearch collection="aoc-briefing-docs" criteria="*" name="qBriefingDocs">
<cfdump var="#qBriefingDocs#"><cfabort>