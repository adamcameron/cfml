<cfoutput>#CGI.foo & CGI.bar#</cfoutput>
<cfset a = CGI.bum & CGI.hand>
<cfoutput>#structKeyExists(CGI, "gonad")#</cfoutput>
<cfoutput>#isDefined("CGI.gonad")#</cfoutput>