<cfset sServer="www.pixl8.co.uk">
<cfset sUser="testpixl8mailer@pixl8.co.uk">
<cfset sPwd="emailmodule">
<cfset sPath="C:\temp\">

<cfpop name="qMailDetails"
	server="#sServer#" username="#sUser#" password="#sPwd#"
	action="GetAll" generateuniquefilenames = "Yes" attachmentpath="#sPath#">

<cfdump var="#qMailDetails#">