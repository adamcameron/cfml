<cfscript>
// testWithAccessors.cfm

writeOutput("<h3>both</h3>");
safeCall("setHasBoth", "value for hasBoth");
safeCall("getHasBoth");

writeOutput("<h3>getter only</h3>");
safeCall("setHasGetter", "value for hasGetter");
safeCall("getHasGetter");

writeOutput("<h3>setter only</h3>");
safeCall("setHasSetter", "value for hasSetter");
safeCall("getHasSetter");

writeOutput("<h3>neither</h3>");
safeCall("setHasNeither", "value for hasNeither");
safeCall("getHasNeither");

</cfscript>


<cffunction name="safeCall" output="true">
	<cfargument name="f" type="string" required="true">
	<cfargument name="value" type="string" required="false">
	<cfset var result = "">
	<cftry>
		<cfset var o = createObject("WithAccessors")>
		Invoking #listLast(getMetadata(o).name, ".")#.#f#(<cfif structKeyExists(arguments, "value")>#value#</cfif>)<br>
		<cfif structKeyExists(arguments, "value")>
			<cfinvoke component="#o#" method="#f#" argumentCollection="#{1=value}#" returnvariable="result">
		<cfelse>
			<cfinvoke component="#o#" method="#f#" returnvariable="result">
		</cfif>
		Result: 
		<cfif isSimpleValue(result)>
			#result#
		<cfelse>
			[object]
		</cfif>
		<br>
		<cfcatch>
			ERROR: #cfcatch.type# #cfcatch.message# #cfcatch.detail#<br>
		</cfcatch> 
	</cftry>
	<cfdump var="#o#" label="object">
	<hr>
</cffunction>