<cfsilent>
	<textarea>whatever</textarea>
	<cfset f()>
</cfsilent>

<cffunction name="f">
	<textarea>whatever</textarea>
	<cfdump var="#variables#">
	<cfabort>
</cffunction>