<cfcomponent output="false" hint="">

	<cffunction name="getNodes" returntype="array" access="remote" output="false" hint="">
		<cfargument name="cftreeitempath" type="string" required="true">
		<cfargument name="cftreeitemvalue" type="string" required="true">
		<cfscript>
			return [
				{
					display	= "Ocelot",
					value	= "Ocelot",
					img		= "cd"
				},
				{
					display	= "Marmoset",
					value	= "Marmoset",
					img		= "remote"
				},
				{
					display	= "Pangolin",
					value	= "Pangolin",
					img		= "floppy",
					leafnode= true
				}
			];
		</cfscript>
	</cffunction>

</cfcomponent>