
<cfset sThisDir = expandPath("./")>
<cfset sSrcFile = "crash">
<cfset sSrcPdf	= "#sSrcFile#.pdf">

<cftry>
	<cfpdf	action	= "getinfo"
		    name	= "stPdf"
		    source	= "#sThisDir##sSrcPdf#"
	>
	<cfset lPages = "">
	<cfloop index="i" from="1" to="#stPdf.totalPages#">
		<cfset lPages = listAppend(lPages, i)>
	</cfloop>
	<cfloop index="i" from="1" to="#stPdf.totalPages#">
		<cfset lDeletePages = listDeleteAt(lPages, listFind(lPages, i))>
		<cfset sPageFile = "#sSrcFile#_page_#i#.pdf">
		<cftry>
			<cfpdf	action		= "deletepages"
				    pages		= "#lDeletePages#"
				    source		= "#sSrcPdf#"
				    overwrite	= "true"
				    destination = "#sPageFile#"
			>
			<cfcatch>
				<cfoutput>Error extracting page #i#:  [#cfcatch.message#][#cfcatch.detail#]<br /></cfoutput>
			</cfcatch>
		</cftry>
	</cfloop>
	<cfcatch>
		<cfoutput>Error reading PDF Info: [#cfcatch.message#][#cfcatch.detail#]<br /></cfoutput>
	</cfcatch>
</cftry>

