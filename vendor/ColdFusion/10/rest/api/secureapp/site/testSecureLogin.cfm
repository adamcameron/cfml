<cfset oSecure = new shared.CF10.rest.api.secureapp.Secure()>
<cfset stUser = oSecure.login(username="adam", password="123")>
<cfdump var="#stUser#">
<br />
<cfset stUser = oSecure.login(username="", password="")>
<cfdump var="#stUser#">
<br />
<cfset stUser = oSecure.login(username="admin", password="123")>
<cfdump var="#stUser#">
<br />
<cfset stUser = oSecure.login(username="admin", password="admin")>
<cfdump var="#stUser#">
<br />