<cfset o1 = createObject("MethodsInline")>
<cfset st1 = getMetadata(o1)>
<cfset o2 = createObject("MethodsViaInclude")>
<cfset st2 = getMetadata(o2)>


<cfdump var="#variables#">