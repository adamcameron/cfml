<cfset variables.testVariable = "Set in #getCurrentTemplatePath()#"> 
<cfset request.testVariable = "Set in #getCurrentTemplatePath()#">

<cf_requestSetter>

<cfdump var="#variables#" label="variables"> 
<cfdump var="#request#" label="request"> 