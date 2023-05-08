<h2>Postfixed operator with implicit struct</h2>
<cfset i = 1>
<cfset a = ArrayNew(1)>
<cfset a[i++] = {foo1 = "bar1", bar1 = "foo1" }>
<cfdump var="#a#">
<cfset a[i++] = {foo2 = "bar2", bar2 = "foo2" }>
<cfdump var="#a#">

<cfoutput>
i: #i#
</cfoutput>
<hr />

<h2>Postfixed operator with simple value</h2>
<cfset i = 1>
<cfset a = ArrayNew(1)>
<cfset a[i++] = 1>
<cfset a[i++] = 2>

<cfdump var="#a#">
<cfoutput>
i: #i#
</cfoutput>
<hr />

<h2>Prefixed operator with implicit struct</h2>
<cfset i = 1>
<cfset a = ArrayNew(1)>
<cfset a[++i] = {foo1 = "bar1", bar1 = "foo1" }>
<cfdump var="#a#">
<cfset a[++i] = {foo2 = "bar2", bar2 = "foo2" }>
<cfdump var="#a#">

<cfoutput>
i: #i#
</cfoutput>
<hr />


<h2>Postfixed operator on separate line with implicit struct</h2>
<cfset i = 0>
<cfset a = ArrayNew(1)>
<cfset i++>
<cfset a[i] = {foo1 = "bar1", bar1 = "foo1" }>

<cfset i++>
<cfset a[i] = {foo2 = "bar2", bar2 = "foo2" }>

<cfdump var="#a#">
<cfoutput>
i: #i#
</cfoutput>
<hr />

<h2>Postfixed operator on separate line with regular struct</h2>
<cfscript>
	function structBuild(){
		return arguments;
	}

	i = 1;
	a = ArrayNew(1);
	a[i++] = structBuild(foo1 = "bar1", bar1 = "foo1");
	a[i++] = structBuild(foo1 = "bar2", bar1 = "foo2");

</cfscript>

<cfdump var="#a#">
<cfoutput>
i: #i#
</cfoutput>
