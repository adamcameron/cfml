<cfflush interval="16">

<cfdirectory action="list" directory="C:\temp\dox" name="filelist">

<cfset tempPath="">

<cfloop query="filelist">
	<cfset fPath="#directory#\#filelist.name#">
	<cfoutput>&lt;cfpdf action="merge" directory="#fpath#" destination="C:\temp\dox\#filelist.name#\#filelist.name#.pdf" overwrite="yes"&gt;<br /></cfoutput>
	<cfpdf action="merge" directory="#fpath#" destination="C:\temp\dox\#filelist.name#\#filelist.name#.pdf" overwrite="yes">
</cfloop>