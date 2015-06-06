<cfset oFile = createObject("java", "java.io.File").init(getCurrentTemplatePath())>
<cfset oDate = createObject("java", "java.util.Date").init(oFile.lastModified())>
<cfdump var="#oDate#">