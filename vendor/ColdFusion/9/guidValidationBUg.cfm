<!--- 3040952 --->
<cfset u = insert("-", createUuid(), 23)>
<cfoutput>[#u#]: #isValid("GUID", u)# (CORRECT)<br />

<cfset u &= " "><!--- append a space --->
[#u#]: #isValid("GUID", u)# (INCORRECT)<br />

<cfset u = " " & u><!--- prepend another space --->
[#u#]: #isValid("GUID", u)# (INCORRECT)<br />
</cfoutput>