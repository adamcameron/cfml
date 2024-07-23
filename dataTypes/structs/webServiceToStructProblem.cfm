<cfset o1 = createObject("webservice", "UnitTestCluster")>
<cfoutput>isObject(o1): #isObject(o1)#</cfoutput><br />

<cffunction name="f" returntype="struct" output="false">
	<cfset var s = "some text">
	<cfset var o2 = createObject("webservice", "UnitTestCluster")>
	<cfset var st = structNew()>

	<cfset st.s = s>
	<cfset st.o2 = o2>
	<cfreturn st>
</cffunction>

<cfset st = f()>
<cfdump var="#st#">

<cfoutput>isObject(st.o2): #isObject(st.o2)#</cfoutput><br />