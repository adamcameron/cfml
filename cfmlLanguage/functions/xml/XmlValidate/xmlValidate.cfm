<cfset stValidate = xmlValidate("C:\temp\mapCountries.xml", "C:\temp\mapCountries.dtd")>
<cfdump var="#stValidate#">

<!---<cfset stValidate = xmlValidate("C:\temp\mapCountries.xml")>
<cfdump var="#stValidate#"> --->

<cfset x= xmlParse("C:\temp\mapCountries.xml", true, "")>
<cfdump var="#x#">