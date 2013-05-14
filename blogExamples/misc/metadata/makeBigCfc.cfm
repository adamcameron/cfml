<cfloop index="i" from="1" to="1000">
<pre>
	function f<cfoutput>#i#</cfoutput>(string uuid="<cfoutput>#createUuid()#</cfoutput>"){
		return ucase(arguments.uuid);
	}
</pre>
</cfloop>