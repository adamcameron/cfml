<cfset framework = fileRead(expandPath("./tinyTestFramework.cfm"))>
<cfset tests = fileRead(expandPath("./tests.cfm"))>

<cfhttp method="post" url="https://acf14-sbx.trycf.com/getremote.cfm" result="httpResponse">
    <cfhttpparam type="formField" name="setupcode" value="#framework#">
    <cfhttpparam type="formField" name="code" value="#tests#">
    <cfhttpparam type="formField" name="asserts" value="">
</cfhttp>

<cfif httpResponse.statusCode EQ "200 OK">
    <cfoutput>#httpResponse.fileContent#</cfoutput>
<cfelse>
    <cfdump var="#httpResponse#">
</cfif>
