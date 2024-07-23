<CFFUNCTION NAME="testFunction">
	<!--- These vars should be function local (var) scoped //--->
	<CFSET var a = 1>
	<CFSET var b = 2>

	<!--- This dump proves that //--->
	<CFDUMP VAR="#getVariablesScope()#">
	
	
	<CFINCLUDE TEMPLATE="test_inc.cfm">
	
	<!--- This dump shows that, after the call to CFINCLUDE, all var scoped variables have been thrown into my variables scope :( //--->
	<CFDUMP VAR="#getVariablesScope()#">
</CFFUNCTION>

<CFFUNCTION NAME="getVariablesScope" RETURNTYPE="struct" OUTPUT="false" ACCESS="private">
	<CFSCRIPT>
		var stReturn = StructNew();
		var oVar = "";

		for (oVar IN variables) {
			if (oVar IS NOT "this" AND NOT IsCustomFunction(variables[oVar]))
				stReturn[oVar] = variables[oVar];
		}
		
		return stReturn;
	</CFSCRIPT>
</CFFUNCTION>