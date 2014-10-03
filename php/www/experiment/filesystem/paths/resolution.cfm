<cfscript>
// resolution.cfm
fileName = getFileFromPath(getCurrentTemplatePath());

[filename, "./#filename#"].each(function(fileName){
	echo("#fileName#:<br>")
	echo("getCanonicalPath(): #getCanonicalPath(fileName)#<br>")
	echo("expandPath(): #expandPath(fileName)#<br>")

	jfile = createObject("java", "java.io.File").init(fileName)
	echo("java.io.File getCanonicalFile(): #jfile.getCanonicalFile()#<br>")
	echo("<hr>");

})
	
</cfscript>