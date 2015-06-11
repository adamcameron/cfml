<cfapplication name="app1">
<cfset application.app1Var = "ocelot">
<cfdump var="#application#">

<cfapplication name="app2">
<cfset application.app2Var = "pangolin">
<cfdump var="#application#">

<cfapplication name="app1">
<cfset application.app1Var2 = "marmoset">
<cfdump var="#application#">