<cfloop index="i" from="1" to="10">
	<cfset o = new C()>
	<cfset s = repeatString(" ", i) & i & repeatString(" ", i)>
	<cfset o.setId(i)>
	<cfset o.setValue(s)>
	<cfset entitySave(o)>
</cfloop>

<cfset a = []>
<cfloop index="i" from="1" to="10">
	<cfset a[i] = entityLoad("C", i)>
	<cfoutput>[#a[i][1].getValue()#]<br /></cfoutput>
</cfloop>
<hr />
<cfdump var="#variables#">