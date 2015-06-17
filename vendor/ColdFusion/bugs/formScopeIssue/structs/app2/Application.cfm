<cfapplication name="foo" sessionmanagement="true">
<cfparam name="session.mySimpleValue" default="0">
<cfoutput><h2>Top of #getFileFromPath(getCurrentTemplatePath())#</h2></cfoutput>
<cfdump var="#session#">