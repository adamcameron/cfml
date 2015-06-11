<cfset st = {firstname="Adam", middleName="", lastname="Cameron", homePhone="",mobilePhone="07969998592"}>
<cfset a = structFindValue(st, "", "ALL")>
<cfdump var="#a#">