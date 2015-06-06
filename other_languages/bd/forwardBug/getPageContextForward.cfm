<cfapplication name="bdBugs2">
<cfoutput>[#getCurrentTemplatePath()#]<br /></cfoutput>

<cfset application.o = createObject("component", "c")>

<cfset application.o.f()>
