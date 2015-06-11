<cfparam name="attributes.seconds" default="0" type="integer">

<cfset variables.nSeconds = attributes.seconds \ 2>
<cfif variables.nSeconds gt 0>
	<cfset variables.uLockHandle = createUuid()>
	<cflock timeout="#variables.nSeconds#" name="#variables.uLockHandle#" type = "readOnly" throwontimeout="no">
		<cflock timeout="#variables.nSeconds#" name="#variables.uLockHandle#" type="Exclusive" throwontimeout="no">
		</cflock>
	</cflock>
</cfif>