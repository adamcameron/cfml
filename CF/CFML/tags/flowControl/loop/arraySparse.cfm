<cfset a = arrayNew(1)>
<cfset a[1] = "one">
<cfset a[4] = "four">

<cfloop array="#a#" index="sItem">
	<cfoutput>#sItem#</cfoutput><br/>
</cfloop>