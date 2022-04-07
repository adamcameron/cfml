<cfdump var="#URL#">
<cfset rc = StructDelete(URL, "SN", "true")>
<cfdump var="RC: #rc#"><br />
<cfdump var="StructIsEmpty: #StructIsEmpty(URL)#">
<cfdump var="#URL#">
<cfabort>