<cfif thisTag.executionMode EQ "start">
    Start processed<br>
    <cfexit method="exittemplate">
</cfif>
<cfset processedContent = "PROCESSED: [#thistag.generatedContent.trim()#]">
<cfset thisTag.generatedContent = "End processed with: [#thistag.generatedContent.trim()#]">
