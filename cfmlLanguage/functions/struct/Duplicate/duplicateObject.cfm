<cfset st1 = structNew()>
<cfset st1.o = createObject("component", "c")>
<cfset st2 = duplicate(st1)>

<cfdump var="#variables#">