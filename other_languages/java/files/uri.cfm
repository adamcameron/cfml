<cfoutput>
<cfset sUri = "file:///C:/temp/readme.txt">
<cfset sUri = "http://localhost:8301/shared/other_languages/java/files/uri.cfm">
<cfset oUri = createObject("java", "java.net.URI").init(sUri)>
<cfdump var="#oUri.getScheme()#">
<cfabort>

<cfset f = createObject("java", "java.io.File").init(oUri)>
exists(): #f.exists()#<br />
fileExists(): #fileExists(sUri)#<br />
</cfoutput>

<cfdump var="#f#">