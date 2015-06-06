<cfparam name="URL.iterations" default="1" type="integer">

<cf_timeit>
<cfloop index="i" from="1" to="#URL.iterations#">
	<cfset u = createUuid()>
</cfloop>
</cf_timeit>

<cf_timeit>
<cfloop index="i" from="1" to="#URL.iterations#">
	<cfset u = uCase(createObject("java", "java.util.UUID").randomUUID().toString())>
</cfloop>
</cf_timeit>

<cfdump var="#u#">