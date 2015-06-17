<cfdirectory action="list" directory="#expandPath('.')#" name="qFiles">
<cfdump var="#getMetadata(qFiles)#">

<cfabort>
<cfloop query="qFiles">
	<cfoutput>#DATELASTMODIFIED#<br /></cfoutput>
</cfloop> 

<cfoutput>#parseDateTime("Wed April 05 09:30:42 EDT 2010")#</cfoutput>