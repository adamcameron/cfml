<cfcomponent output="false" hint="Test CFC with 20 getters and setters">


	<cfset variables.prop1 = "">
	<cfset variables.prop2 = "">
	<cfset variables.prop3 = "">
	<cfset variables.prop4 = "">
	<cfset variables.prop5 = "">
	<cfset variables.prop6 = "">
	<cfset variables.prop7 = "">
	<cfset variables.prop8 = "">
	<cfset variables.prop9 = "">
	<cfset variables.prop10 = "">
	<cfset variables.prop11 = "">
	<cfset variables.prop12 = "">
	<cfset variables.prop13 = "">
	<cfset variables.prop14 = "">
	<cfset variables.prop15 = "">
	<cfset variables.prop16 = "">
	<cfset variables.prop17 = "">
	<cfset variables.prop18 = "">
	<cfset variables.prop19 = "">
	<cfset variables.prop20 = "">


	<cffunction name="init" output="false" returntype="Test20" access="public" hint="Initialises CFC">
		<cfargument name="prop1" type="string" required="false" hint="Value for prop1">
		<cfargument name="prop2" type="string" required="false" hint="Value for prop2">
		<cfargument name="prop3" type="string" required="false" hint="Value for prop3">
		<cfargument name="prop4" type="string" required="false" hint="Value for prop4">
		<cfargument name="prop5" type="string" required="false" hint="Value for prop5">
		<cfargument name="prop6" type="string" required="false" hint="Value for prop6">
		<cfargument name="prop7" type="string" required="false" hint="Value for prop7">
		<cfargument name="prop8" type="string" required="false" hint="Value for prop8">
		<cfargument name="prop9" type="string" required="false" hint="Value for prop9">
		<cfargument name="prop10" type="string" required="false" hint="Value for prop10">
		<cfargument name="prop11" type="string" required="false" hint="Value for prop11">
		<cfargument name="prop12" type="string" required="false" hint="Value for prop12">
		<cfargument name="prop13" type="string" required="false" hint="Value for prop13">
		<cfargument name="prop14" type="string" required="false" hint="Value for prop14">
		<cfargument name="prop15" type="string" required="false" hint="Value for prop15">
		<cfargument name="prop16" type="string" required="false" hint="Value for prop16">
		<cfargument name="prop17" type="string" required="false" hint="Value for prop17">
		<cfargument name="prop18" type="string" required="false" hint="Value for prop18">
		<cfargument name="prop19" type="string" required="false" hint="Value for prop19">
		<cfargument name="prop20" type="string" required="false" hint="Value for prop20">
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
		<cfif structKeyExists(arguments, "prop6")>
			<cfset variables.prop6 = arguments.prop6>
		</cfif>
		<cfif structKeyExists(arguments, "prop7")>
			<cfset variables.prop7 = arguments.prop7>
		</cfif>
		<cfif structKeyExists(arguments, "prop8")>
			<cfset variables.prop8 = arguments.prop8>
		</cfif>
		<cfif structKeyExists(arguments, "prop9")>
			<cfset variables.prop9 = arguments.prop9>
		</cfif>
		<cfif structKeyExists(arguments, "prop10")>
			<cfset variables.prop10 = arguments.prop10>
		</cfif>
		<cfif structKeyExists(arguments, "prop11")>
			<cfset variables.prop11 = arguments.prop11>
		</cfif>
		<cfif structKeyExists(arguments, "prop12")>
			<cfset variables.prop12 = arguments.prop12>
		</cfif>
		<cfif structKeyExists(arguments, "prop13")>
			<cfset variables.prop13 = arguments.prop13>
		</cfif>
		<cfif structKeyExists(arguments, "prop14")>
			<cfset variables.prop14 = arguments.prop14>
		</cfif>
		<cfif structKeyExists(arguments, "prop15")>
			<cfset variables.prop15 = arguments.prop15>
		</cfif>
		<cfif structKeyExists(arguments, "prop16")>
			<cfset variables.prop16 = arguments.prop16>
		</cfif>
		<cfif structKeyExists(arguments, "prop17")>
			<cfset variables.prop17 = arguments.prop17>
		</cfif>
		<cfif structKeyExists(arguments, "prop18")>
			<cfset variables.prop18 = arguments.prop18>
		</cfif>
		<cfif structKeyExists(arguments, "prop19")>
			<cfset variables.prop19 = arguments.prop19>
		</cfif>
		<cfif structKeyExists(arguments, "prop20")>
			<cfset variables.prop20 = arguments.prop20>
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


	<cffunction name="getProp6" output="false" returntype="string" access="public" hint="Returns value of prop6">
		<cfreturn variables.prop6>
	</cffunction>


	<cffunction name="setProp6" output="false" returntype="void" access="public" hint="Sets value of prop6">
		<cfargument name="prop6" type="string" required="true" hint="Value for prop6">
		<cfset variables.prop6 = arguments.prop6>
	</cffunction>


	<cffunction name="getProp7" output="false" returntype="string" access="public" hint="Returns value of prop7">
		<cfreturn variables.prop7>
	</cffunction>


	<cffunction name="setProp7" output="false" returntype="void" access="public" hint="Sets value of prop7">
		<cfargument name="prop7" type="string" required="true" hint="Value for prop7">
		<cfset variables.prop7 = arguments.prop7>
	</cffunction>


	<cffunction name="getProp8" output="false" returntype="string" access="public" hint="Returns value of prop8">
		<cfreturn variables.prop8>
	</cffunction>


	<cffunction name="setProp8" output="false" returntype="void" access="public" hint="Sets value of prop8">
		<cfargument name="prop8" type="string" required="true" hint="Value for prop8">
		<cfset variables.prop8 = arguments.prop8>
	</cffunction>


	<cffunction name="getProp9" output="false" returntype="string" access="public" hint="Returns value of prop9">
		<cfreturn variables.prop9>
	</cffunction>


	<cffunction name="setProp9" output="false" returntype="void" access="public" hint="Sets value of prop9">
		<cfargument name="prop9" type="string" required="true" hint="Value for prop9">
		<cfset variables.prop9 = arguments.prop9>
	</cffunction>


	<cffunction name="getProp10" output="false" returntype="string" access="public" hint="Returns value of prop10">
		<cfreturn variables.prop10>
	</cffunction>


	<cffunction name="setProp10" output="false" returntype="void" access="public" hint="Sets value of prop10">
		<cfargument name="prop10" type="string" required="true" hint="Value for prop10">
		<cfset variables.prop10 = arguments.prop10>
	</cffunction>


	<cffunction name="getProp11" output="false" returntype="string" access="public" hint="Returns value of prop11">
		<cfreturn variables.prop11>
	</cffunction>


	<cffunction name="setProp11" output="false" returntype="void" access="public" hint="Sets value of prop11">
		<cfargument name="prop11" type="string" required="true" hint="Value for prop11">
		<cfset variables.prop11 = arguments.prop11>
	</cffunction>


	<cffunction name="getProp12" output="false" returntype="string" access="public" hint="Returns value of prop12">
		<cfreturn variables.prop12>
	</cffunction>


	<cffunction name="setProp12" output="false" returntype="void" access="public" hint="Sets value of prop12">
		<cfargument name="prop12" type="string" required="true" hint="Value for prop12">
		<cfset variables.prop12 = arguments.prop12>
	</cffunction>


	<cffunction name="getProp13" output="false" returntype="string" access="public" hint="Returns value of prop13">
		<cfreturn variables.prop13>
	</cffunction>


	<cffunction name="setProp13" output="false" returntype="void" access="public" hint="Sets value of prop13">
		<cfargument name="prop13" type="string" required="true" hint="Value for prop13">
		<cfset variables.prop13 = arguments.prop13>
	</cffunction>


	<cffunction name="getProp14" output="false" returntype="string" access="public" hint="Returns value of prop14">
		<cfreturn variables.prop14>
	</cffunction>


	<cffunction name="setProp14" output="false" returntype="void" access="public" hint="Sets value of prop14">
		<cfargument name="prop14" type="string" required="true" hint="Value for prop14">
		<cfset variables.prop14 = arguments.prop14>
	</cffunction>


	<cffunction name="getProp15" output="false" returntype="string" access="public" hint="Returns value of prop15">
		<cfreturn variables.prop15>
	</cffunction>


	<cffunction name="setProp15" output="false" returntype="void" access="public" hint="Sets value of prop15">
		<cfargument name="prop15" type="string" required="true" hint="Value for prop15">
		<cfset variables.prop15 = arguments.prop15>
	</cffunction>


	<cffunction name="getProp16" output="false" returntype="string" access="public" hint="Returns value of prop16">
		<cfreturn variables.prop16>
	</cffunction>


	<cffunction name="setProp16" output="false" returntype="void" access="public" hint="Sets value of prop16">
		<cfargument name="prop16" type="string" required="true" hint="Value for prop16">
		<cfset variables.prop16 = arguments.prop16>
	</cffunction>


	<cffunction name="getProp17" output="false" returntype="string" access="public" hint="Returns value of prop17">
		<cfreturn variables.prop17>
	</cffunction>


	<cffunction name="setProp17" output="false" returntype="void" access="public" hint="Sets value of prop17">
		<cfargument name="prop17" type="string" required="true" hint="Value for prop17">
		<cfset variables.prop17 = arguments.prop17>
	</cffunction>


	<cffunction name="getProp18" output="false" returntype="string" access="public" hint="Returns value of prop18">
		<cfreturn variables.prop18>
	</cffunction>


	<cffunction name="setProp18" output="false" returntype="void" access="public" hint="Sets value of prop18">
		<cfargument name="prop18" type="string" required="true" hint="Value for prop18">
		<cfset variables.prop18 = arguments.prop18>
	</cffunction>


	<cffunction name="getProp19" output="false" returntype="string" access="public" hint="Returns value of prop19">
		<cfreturn variables.prop19>
	</cffunction>


	<cffunction name="setProp19" output="false" returntype="void" access="public" hint="Sets value of prop19">
		<cfargument name="prop19" type="string" required="true" hint="Value for prop19">
		<cfset variables.prop19 = arguments.prop19>
	</cffunction>


	<cffunction name="getProp20" output="false" returntype="string" access="public" hint="Returns value of prop20">
		<cfreturn variables.prop20>
	</cffunction>


	<cffunction name="setProp20" output="false" returntype="void" access="public" hint="Sets value of prop20">
		<cfargument name="prop20" type="string" required="true" hint="Value for prop20">
		<cfset variables.prop20 = arguments.prop20>
	</cffunction>


</cfcomponent>

