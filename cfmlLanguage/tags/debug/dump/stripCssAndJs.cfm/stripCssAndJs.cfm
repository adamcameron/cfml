<cfsavecontent variable="dump">
	<cfdump var="#CGI#">
</cfsavecontent>
<cfset dump = reReplaceNoCase(dump, "<style>.*?</style>", "", "ALL")>
<cfset dump = reReplaceNoCase(dump, "<script\s[^>]*>.*?</script>", "", "ALL")>
<link href='http://adamcameroncoldfusion.cfmldeveloper.com/lib/css/blog.css' rel='stylesheet'/>
<script src='http://adamcameroncoldfusion.cfmldeveloper.com/lib/js/blog.js'></script>
<cfoutput>#dump#</cfoutput>