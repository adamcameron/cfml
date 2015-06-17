<cffile action="upload" filefield="image" destination="#getDirectoryFromPath(getCurrentTemplatePath())#" nameconflict="makeunique" result="stUpload">
<cfset sUploadedFile = stUpload.serverDirectory & "\" & stUpload.serverFile>

<!--- <cffile action="readbinary" file="#sUploadedFile#" variable="fImage"> --->

<!--- <cfimage source="#sUploadedFile#" name="vimage_image"> --->

<!--- --->
<cfimage action="info" source="#sUploadedFile#" structname="imageInfo">

<cfset sizeby = iif(imageInfo.height gt imageInfo.width, "'height'", "'width'")>
<cfset fSize = iif(evaluate('imageInfo.' & sizeby) gt 800, "800", "evaluate('imageInfo.' & sizeby)")>

<cfif sizeby is "height">
    <cfimage action="resize" width="" height="#fSize#" source="#sUploadedFile#" name="vImage_image">
<cfelse>
    <cfimage action="resize" width="#fSize#" height="" source="#sUploadedFile#" name="vimage_image">
</cfif>

<cftry>
<cfquery datasource="scratch">
    INSERT INTO tr_vimages (ven_id, vimage_image)
    VALUES (
    	<cfqueryparam value="#form.ven_id#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#ImageGetBlob(vimage_image)#" cfsqltype="cf_sql_blob">
    )
</cfquery>
<cffile action="delete" file="#sUploadedFile#">
<cfcatch>
	<cfdump var="#variables#" label="variables">
	<cfdump var="#form#" label="form">
	<cfdump var="#cffile#" label="cffile">
	<cfdump var="#cfcatch#" label="cfcatch">
</cfcatch>
</cftry>