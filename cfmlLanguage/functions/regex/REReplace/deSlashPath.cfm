<cfset sPath1 = "C:\inetpub\wwwroot\\\">
<cfoutput>#reReplace(sPath1, "[\\/]*$", "", "ONE")#<br /></cfoutput>

<cfset sPath2 = "C:\inetpub\wwwroot\">
<cfoutput>#reReplace(sPath2, "[\\/]*$", "", "ONE")#<br /></cfoutput>

<cfset sPath3 = "C:\inetpub\wwwroot">
<cfoutput>#reReplace(sPath3, "[\\/]*$", "", "ONE")#<br /></cfoutput>