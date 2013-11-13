<cfcomponent name="test" accessors="true">
	
	<cfproperty name="foo" type="string" />
 
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="foo" type="string" required="true" />
		
		<cfset setFoo(arguments.foo) />

	<cfreturn this />
	</cffunction>

	<cffunction name="setFoo" access="private" returntype="void" output="false">
		<cfargument name="value" type="string" required="true" />
		
		<cfset variables.foo = "set by private setter" />
	
	</cffunction>


 
</cfcomponent>