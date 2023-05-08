<cfcomponent output="false" hint="Test CFC with 5 getters and setters">


	<cfset variables.prop1 = "">
	<cfset variables.prop2 = "">
	<cfset variables.prop3 = "">
	<cfset variables.prop4 = "">
	<cfset variables.prop5 = "">


	<cffunction name="init" output="false" returntype="Test5" access="public" hint="Initialises CFC">
		<cfargument name="prop1" type="string" required="false" hint="Value for prop1">
		<cfargument name="prop2" type="string" required="false" hint="Value for prop2">
		<cfargument name="prop3" type="string" required="false" hint="Value for prop3">
		<cfargument name="prop4" type="string" required="false" hint="Value for prop4">
		<cfargument name="prop5" type="string" required="false" hint="Value for prop5">
		<cfif structKeyExists(arguments, "prop1")>
			<cfset variables.prop1 = arguments.prop1>
		</cfif>
		<cfif structKeyExists(arguments, "prop2")>
			<cfset variables.prop2 = arguments.prop2>
		</cfif>
		<cfif structKeyExists(arguments, "prop3")>
			<cfset variables.prop3 = arguments.prop3>
		</cfif>
		<cfif structKeyExists(arguments, "prop4")>
			<cfset variables.prop4 = arguments.prop4>
		</cfif>
		<cfif structKeyExists(arguments, "prop5")>
			<cfset variables.prop5 = arguments.prop5>
		</cfif>
		<cfreturn this>
	</cffunction>


	<cffunction name="getProp1" output="false" returntype="string" access="public" hint="Returns value of prop1">
		<cfreturn variables.prop1>
	</cffunction>


	<cffunction name="setProp1" output="false" returntype="void" access="public" hint="Sets value of prop1">
		<cfargument name="prop1" type="string" required="true" hint="Value for prop1">
		<cfset variables.prop1 = arguments.prop1>
	</cffunction>


	<cffunction name="getProp2" output="false" returntype="string" access="public" hint="Returns value of prop2">
		<cfreturn variables.prop2>
	</cffunction>


	<cffunction name="setProp2" output="false" returntype="void" access="public" hint="Sets value of prop2">
		<cfargument name="prop2" type="string" required="true" hint="Value for prop2">
		<cfset variables.prop2 = arguments.prop2>
	</cffunction>


	<cffunction name="getProp3" output="false" returntype="string" access="public" hint="Returns value of prop3">
		<cfreturn variables.prop3>
	</cffunction>


	<cffunction name="setProp3" output="false" returntype="void" access="public" hint="Sets value of prop3">
		<cfargument name="prop3" type="string" required="true" hint="Value for prop3">
		<cfset variables.prop3 = arguments.prop3>
	</cffunction>


	<cffunction name="getProp4" output="false" returntype="string" access="public" hint="Returns value of prop4">
		<cfreturn variables.prop4>
	</cffunction>


	<cffunction name="setProp4" output="false" returntype="void" access="public" hint="Sets value of prop4">
		<cfargument name="prop4" type="string" required="true" hint="Value for prop4">
		<cfset variables.prop4 = arguments.prop4>
	</cffunction>


	<cffunction name="getProp5" output="false" returntype="string" access="public" hint="Returns value of prop5">
		<cfreturn variables.prop5>
	</cffunction>


	<cffunction name="setProp5" output="false" returntype="void" access="public" hint="Sets value of prop5">
		<cfargument name="prop5" type="string" required="true" hint="Value for prop5">
		<cfset variables.prop5 = arguments.prop5>
	</cffunction>


</cfcomponent>

