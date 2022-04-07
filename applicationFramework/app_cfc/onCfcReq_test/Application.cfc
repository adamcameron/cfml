<cfcomponent output="false">

	<cffunction name="onCfcRequest" output="true" returntype="any">
		<cfargument name="component" type="string" required="true">
		<cfargument name="method" type="string" required="true">
		<cfargument name="args" type="struct" required="true">
		
		<cfset var oComp = createObject("component", arguments.component)>
		<cfset var result = "">
		
		<cfinvoke component="#oComp#" method="#arguments.method#" argumentcollection="#arguments.args#" returnvariable="result" />


		<cfdump var="#getComponentMetadata(arguments.component)#">		
		<cfdump var="#result#">		
				

	</cffunction>
	
	<cfscript>
	public any function onMissingMethod(string methodName, struct methodArguments){
		return "No method #arguments.methodName# with arguments #structKeyList(arguments.methodArguments)# found";
	}	
	</cfscript>
</cfcomponent>
