<!---<cfset fileDelete("ram:///*.*")>--->
<cfset q = directoryList("ram:///", true, "all")>
<cfdump var="#q#">
