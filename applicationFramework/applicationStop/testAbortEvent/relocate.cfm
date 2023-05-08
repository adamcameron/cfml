<cfset logIt(getCurrentTemplatePath().listLast("/") & " TOP")>
<cflocation url="./target.cfm" addtoken="false">
<cfset logIt(getCurrentTemplatePath().listLast("/") & " BOTTOM")>
