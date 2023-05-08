<!--- nestedWithTags.cfm --->

<cflog file="nestedWithTags01" text="Top of nestedWithTags.cfm ">
<cfthread name="t1" action="run">
	<cfset sleep(1000)>
		
	<cfthread name="t2" action="run">
		<cfset sleep(1000)>
		<cflog file="nestedWithTags01" text="Bottom of t2">
	</cfthread>
	<cflog file="nestedWithTags01" text="Bottom of t1">
</cfthread>
<cflog file="nestedWithTags01" text="Bottom of nestedWithTags.cfm">
