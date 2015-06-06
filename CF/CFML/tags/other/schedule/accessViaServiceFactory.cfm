<cfset oFactory = createObject("java", "coldfusion.server.ServiceFactory")>

<cfset oCv = createObject("java", "ClassViewer")>

<cfdump var="#oFactory#" expand="false">
<cfdump var="#oFactory.getCronService()#" expand="false">
<cfdump var="#oFactory.getCronService().listAll()#" expand="false">