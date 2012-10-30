<cfinterface>
	<cffunction name="registerObserver">
		<cfargument name="observer" type="any">
	</cffunction>

	<cffunction name="unregisterObserver">
		<cfargument name="observer" type="any">
	</cffunction>
	
	<cffunction name="notifyObservers">
		<cfargument name="args" type="any">
	</cffunction>
</cfinterface>
