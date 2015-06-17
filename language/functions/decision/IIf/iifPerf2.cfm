<cfparam name="url.count" default="0" type="integer">

<!--- populate some dummy data --->
<cfset a = listToArray("aardvark,badger,cassowary,dikdik,echidna,ferret,goat,hippo,ibis,jackal")>
<cfset iSize = arrayLen(a)>
<cfloop index="i" from="1" to="#iSize#">
	<cfset variables[a[i]] = randRange(1, iSize)>
</cfloop>

iif() runtime<br />
<cf_timeit>
<cfloop index="i" from="1" to="#url.count#">
	<cfset n = iif(i mod 2, a[randRange(1,iSize)], a[randRange(1,iSize)])>
</cfloop>
</cf_timeit>

&lt;cfif&gt; runtime<br />
<cf_timeit>
<cfloop index="i" from="1" to="#url.count#">
	<cfif i mod 2>
		<cfset b = a[randRange(1, iSize)]>
	<cfelse>
		<cfset b = a[randRange(1, iSize)]>
	</cfif>
</cfloop>
</cf_timeit>