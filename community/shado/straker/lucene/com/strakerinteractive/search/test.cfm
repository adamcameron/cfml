<cfset action="poo">
<cftry>
	<cfparam name="action" default="" type="regex" pattern="PURGE|LIST|MAP|DELETE|REPAIR|CATEGORYLIST|CREATE|OPTIMIZE">
	<cfcatch>
		<cfthrow	message 	= "Argument validation error for method collection()"
					detail		= "The value of the attribute ACTION, which is currently ""#action#"", must be one of the values: PURGE,LIST,MAP,DELETE,REPAIR,CATEGORYLIST,CREATE,OPTIMIZE."
					type		= "com.strakerinteractive.search.Verity"
					errorcode	= "collection.badAction"
		>
	</cfcatch>
</cftry>