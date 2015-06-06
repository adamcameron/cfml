<cffile action="read" file="#expandPath('./')#test.xml" variable="sDoc">
<cfset xDoc = xmlParse(sDoc)>
<!--- <cfdump var="#xDoc#"> --->

<cfset a = xDoc.aaa.bbb>
<!--- <cfdump var="#a#" label="a">
<cfdump var="#a[1]#" label="a[1]">
<cfdump var="#a[2]#" label="a[1]">
 --->

<!--- <cfloop index="i" from="1" to="#arrayLen(a)#">
	<cfdump var="#a[i]#" label="a[#i#]">
</cfloop> --->


<cfset a = xmlSearch(xDoc, "/aaa")>
<cfset b=a[1].bbb>
<cfdump var="#b#" label="b">
<cfset f(a=b)>


<cffunction name="f">
	<cfargument name="a" type="any" required="true">
		<cfoutput>#isArray(arguments.a)#</cfoutput><br />
		<cfoutput>#isXml(arguments.a)#</cfoutput>
		<cfdump var="#arguments.a#" label="in f()">
		<cfloop index="i" from="1" to="#arrayLen(arguments.a)#">
			<cfdump var="#arguments.a[i]#" label="a[#i#]">
		</cfloop>

</cffunction>