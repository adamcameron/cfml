<cfscript>
response = application.container.numberController.handlePost({english="one", maori="tahi"})
writeDump(response)
</cfscript>