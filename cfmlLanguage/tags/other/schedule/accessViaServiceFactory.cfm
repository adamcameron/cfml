<cfset oFactory = createObject("java", "coldfusion.server.ServiceFactory")>

<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfdump var="#oFactory#" expand="false">
<cfdump var="#oFactory.getCronService()#" expand="false">
<cfdump var="#oFactory.getCronService().listAll()#" expand="false">