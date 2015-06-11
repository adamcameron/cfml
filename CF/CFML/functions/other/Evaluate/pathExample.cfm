<cfset path ="##request.root##filename1.cfm">
<cfset request.root = "C:\Inetpub\wwwroot\">
<cfoutput>#evaluate(de(path))#</cfoutput>