<cfflush interval="20">
<cfparam name="URL.iterations" default="1000">
evaluate()
<cf_timeit>
	<cfloop index="i" from="1" to="#URL.iterations#">
		<cfset sKey = "var" & randRange(1, 50000)>
		<cfset variables[sKey] = i>
		<cfset x = evaluate("variables.#sKey#")>
	</cfloop>
</cf_timeit>

associative array
<cf_timeit>
	<cfloop index="i" from="1" to="#URL.iterations#">
		<cfset sKey = "var" & randRange(1, 50000)>
		<cfset variables[sKey] = i>
		<cfset x = variables[sKey]>
	</cfloop>
</cf_timeit>