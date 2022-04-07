<cfparam name="url.count" default="0" type="integer">

iif() boolean<br />
<cf_timeit>
<cfloop index="i" from="1" to="#url.count#">
	<cfset b = iif(i mod 2, true, false)>
</cfloop>
</cf_timeit>

&lt;cfif&gt; boolean<br />
<cf_timeit>
<cfloop index="i" from="1" to="#url.count#">
	<cfif i mod 2>
		<cfset b = true>
	<cfelse>
		<cfset b = false>
	</cfif>
</cfloop>
</cf_timeit>

iif() string<br />
<cf_timeit>
<cfloop index="i" from="1" to="#url.count#">
	<cfset b = iif(i mod 2, de("blue"), de("red"))>
</cfloop>
</cf_timeit>

&lt;cfif&gt; boolean<br />
<cf_timeit>
<cfloop index="i" from="1" to="#url.count#">
	<cfif i mod 2>
		<cfset b = "blue">
	<cfelse>
		<cfset b = "red">
	</cfif>
</cfloop>
</cf_timeit>
<!---
iif() expression<br />
<cfset lColours = "blue,red">
<cf_timeit>
<cfloop index="i" from="1" to="#url.count#">
	<cfset b = iif(i mod 2, listGetAt(lColours, 1), listGetAt(lColours, 2))>
</cfloop>
</cf_timeit>

&lt;cfif&gt; expression<br />
<cf_timeit>
<cfloop index="i" from="1" to="#url.count#">
	<cfif i mod 2>
		<cfset b = listGetAt(lColours, 1)>
	<cfelse>
		<cfset b = listGetAt(lColours, 1)>
	</cfif>
</cfloop>
</cf_timeit>
 --->