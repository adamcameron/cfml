<cfset myPath = getCurrentTemplatePath()>
<cfset myExists=Fileexists(myPath)>
<cfSet TIMEOUT="#DateAdd("h", "-6", Now() )#"    >           
<cfset myFile = CreateObject("java", "java.io.File")>
<cfset myFile.init(myPath)>
<cfset last_modified = myFile.lastModified()>
<cfset oDf = createObject("java", "java.text.SimpleDateFormat")>
<cdset oDf.init("yyyy-MM-dd HH:mm:ss.SSS")>
<cfset dLastModified = parseDateTime(oDf.format(last_modified))>
<cfdump var="#variables#">