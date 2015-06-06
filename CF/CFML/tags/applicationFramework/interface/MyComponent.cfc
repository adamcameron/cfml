<!--- IMyInterface.cfc --->
<!---
<cfinterface>
	<cffunction name="myMethod" returntype="IMyInterface" access="public" />
</cfinterface>
 --->

<!--- MyComponent.cfc --->
<cfcomponent implements="IMyInterface">

	<cfset variables.foo = "bar">

	<cffunction name="myMethod" returntype="IMyInterface" access="public">
		<cfreturn this>
	</cffunction>

	<cffunction name="getFoo" returntype="string" access="public">
		<cfreturn variables.foo>
	</cffunction>

</cfcomponent>

<!--- main.cfm --->
<!---
<cfset o = createObject("component", "MyComponent")>
<cfoutput>#o.getFoo()#</cfoutput>
 --->
