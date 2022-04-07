<!--- ViaTags.cfc --->
<cfcomponent output="false">

	<cffunction name="outputSuppressedNoOutput" output="false" returntype="string" access="public">
		<cfsavecontent variable="local.value">
			this is what we expect
		</cfsavecontent>
		<cfreturn trim(value)>
	</cffunction>

	<cffunction name="outputSuppressedExplicitOutput" output="false" returntype="string" access="public">
		<cfsavecontent variable="local.value">
			<cfoutput>this is what we expect</cfoutput>
		</cfsavecontent>
		<cfreturn trim(value)>
	</cffunction>

	<cffunction name="outputUnspecifiedNoOutput" returntype="string" access="public">
		<cfsavecontent variable="local.value">
			this is what we expect
		</cfsavecontent>
		<cfreturn trim(value)>
	</cffunction>

	<cffunction name="outputUnspecifiedExplicitOutput" returntype="string" access="public">
		<cfsavecontent variable="local.value">
			<cfoutput>this is what we expect</cfoutput>
		</cfsavecontent>
		<cfreturn trim(value)>
	</cffunction>

	<cffunction name="outputTrueNoOutput" output="true" returntype="string" access="public">
		<cfsavecontent variable="local.value">
			this is what we expect
		</cfsavecontent>
		<cfreturn trim(value)>
	</cffunction>

	<cffunction name="outputTrueExplicitOutput" output="true" returntype="string" access="public">
		<cfsavecontent variable="local.value">
			<cfoutput>this is what we expect</cfoutput>
		</cfsavecontent>
		<cfreturn trim(value)>
	</cffunction>

</cfcomponent>