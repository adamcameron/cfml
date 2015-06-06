<cfset oJvm = createObject("java", "java.lang.System")>

<cfdump var="#oJvm.getProperties()#">