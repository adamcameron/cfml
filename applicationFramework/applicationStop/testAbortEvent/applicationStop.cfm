<cfset logIt(getCurrentTemplatePath().listLast("/") & " TOP")>
<cfset applicationStop()>
<cfset logIt(getCurrentTemplatePath().listLast("/") & " BOTTOM")>
