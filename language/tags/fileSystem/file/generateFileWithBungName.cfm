<cfset sFileName = "My " & chr(inputBaseN("12",16)) & "special" & chr(inputBaseN("13",16)) & " file">
<cfset sFilePath = expandPath("./#sFileName#")>
<!--- <cffile action="write" file="#sFilePath#" output="#sFileName#"> --->
<cfoutput>#sFileName#</cfoutput>