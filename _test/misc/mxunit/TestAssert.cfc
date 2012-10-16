<cfcomponent extends="mxunit.framework.TestCase">

	<cffunction name="setup" returntype="void" access="public" output="false">
		<cfset variables.testAssertInstance = createObject("component", "mxunit.framework.Assert")>
	</cffunction>
	
	<cffunction name="testAddAssertDecorator_functions_baseline" returntype="void" access="public" output="false" hint="Basic test of extracting functions from a decorator.">
		<cfscript>
			var assertVariables = "";
			
			variables.testAssertInstance.addAssertDecorator("testcfcs.StandAlone");
			
			variables.testAssertInstance.getVariables = getVariables;
			assertVariables = variables.testAssertInstance.getVariables();
	
			assertTrue(structKeyExists(assertVariables, "singleFunction"), "Expected to find a function singleFunction(), but did not");
		</cfscript>
	</cffunction>
	
	<cffunction name="testAddAssertDecorator_functions_inheritance" returntype="void" access="public" output="false" hint="Basic test of extracting functions from a decorator which extends another decorator.">
		<cfscript>
			var assertVariables = "";
			
			variables.testAssertInstance.addAssertDecorator("testcfcs.SubDecorator");
			
			variables.testAssertInstance.getVariables = getVariables;
			assertVariables = variables.testAssertInstance.getVariables();
	
			assertTrue(structKeyExists(assertVariables, "subDecoratorMethod"), "Expected to find a function subDecoratorMethod(), but did not");
			assertTrue(structKeyExists(assertVariables, "baseDecoratorMethod"), "Expected to find a function baseDecoratorMethod(), but did not");
		</cfscript>
	</cffunction>
	
	<cffunction name="testAddAssertDecorator_functions_override" returntype="void" access="public" output="false" hint="Basic test of extracting functions from a decorator which extends another decorator.">
		<cfscript>
			var assertVariables = "";
			
			variables.testAssertInstance.addAssertDecorator("testcfcs.OverrideDecorator");
			
			variables.testAssertInstance.getVariables = getVariables;
			assertVariables = variables.testAssertInstance.getVariables();
			assertTrue(structKeyExists(assertVariables, "baseDecoratorMethod"), "Expected to find a function baseDecoratorMethod(), but did not");
			assertEquals("Overriden", getMetadata(assertVariables.baseDecoratorMethod).returnType, "Override baseDecoratorMethod() was not found");
		</cfscript>
	</cffunction>
	
	<cffunction name="getVariables" returntype="struct" access="private" output="false" hint="Inject me into an object to get at its private variables.">
		<cfreturn variables>
	</cffunction>
	
</cfcomponent>