<cfset t = new Test("bar") />

<cfdump var="#t#"/>

<cfset t.setFoo("public setter") />

<cfdump var="#t#" />
<hr>
<cfloop item="key" collection="#t#">
	<cfdump var="#getMetadata(t[key])#" label="t">
</cfloop>