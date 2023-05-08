<cfset sFilePath = "ram:///myFile.dat">
<cfoutput>
fileExists("#sFilePath#"): [#fileExists(sFilePath)#]<br /> 
</cfoutput>