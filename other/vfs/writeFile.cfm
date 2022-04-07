<cfset sFilePath = "ram:///myFile.dat">
<cfset sData = repeatString("A", 16384)>
<cffile action="write" file="#sFilePath#" output="#sData#">

<cfoutput>
fileExists("#sFilePath#"): [#fileExists(sFilePath)#]<br /> 
</cfoutput>