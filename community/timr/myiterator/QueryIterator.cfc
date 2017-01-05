<cfcomponent name="QueryIterator" extends="Iterator" output="no">
	
	
	<cfset instance.query = "">
	
	
	<!--- Methods which override methods in the base Iterator component.  --->
	
	
	<cffunction name="init" access="public" returntype="void" output="no"
			hint="Initializes the query iterator component.">

		<cfargument name="query" required="true" type="query">

		<cfset instance.query = arguments.query>

	</cffunction>
	
	
	<cffunction name="size" access="public" returntype="numeric" output="no"
			hint="Returns the record count of the query.">
		
		<cfreturn getQuery().recordCount>
		
	</cffunction>
	
	
	<!--- Methods specific to the QueryIterator component. --->
	
	
	<cffunction name="getQuery" access="public" returntype="query" output="no"
			hint="Returns a reference to the query.">
		
		<cfif not isQuery(instance.query)>
			
			<cfthrow message="The QueryIterator has not get been initialized. Call the init() method, passing in the query that you would like to iterate over.">
			
		</cfif>
		
		<cfreturn instance.query>
		
	</cffunction>
	
</cfcomponent>