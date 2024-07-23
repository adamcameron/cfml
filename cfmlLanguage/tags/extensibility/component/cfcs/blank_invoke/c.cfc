<cfcomponent>
	<cffunction name="f">
		F CALLED<br />
	</cffunction>

	<cffunction name="g">
		G CALLED<br />
		<cfinvoke component="" method="f">
	</cffunction>

</cfcomponent>