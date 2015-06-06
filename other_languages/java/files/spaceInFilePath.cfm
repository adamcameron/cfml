<cfset oFile = createObject("java", "java.io.File").init("C:\temp\space dir\test.txt")>
<cfoutput>#oFile.length()#</cfoutput>