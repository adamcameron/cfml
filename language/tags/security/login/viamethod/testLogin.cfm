<cfparam name="URL.username">
<cfparam name="URL.password">
<cfset o = new Secure()>
<cfset stUser = o.login(username=URL.username, password=URL.password)>
<cfdump var="#stUser#">