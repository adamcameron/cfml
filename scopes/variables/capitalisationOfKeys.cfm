<cfscript>
variables.dotNotation = 0;
variables['associativeArrayNotation'] = 0;
noScope = 0;
param name="noScopeParam" default=0;
param name="variables.scopedParam" default=0;
structInsert(variables, "structInsert", 0, true);
</cfscript>
<cfparam name="noScopeCfParam" default="0">
<cfparam name="variables.scopedCfParam" default="0">
<cfset noScopeCfSet = 0>
<cfset variables.scopedCfSet = 0>

<cfset j.direct = serializeJson(variables)>

<cfscript>
variables.subStruct = {};
variables.subStruct.dotNotation = 0;
variables.subStruct['associativeArrayNotation'] = 0;
param name="variables.subStruct.scopedParam" default=0;
structInsert(variables.subStruct, "structInsert", 0, true);
</cfscript>
<cfparam name="variables.subStruct.scopedCfParam" default="0">
<cfset variables.subStruct.scopedCfSet = 0>

<cfset j.subStruct = serializeJson(variables.subStruct)>

Variables Scope<br />
<cfloop collection="#j#" item="key">
	<cfoutput>
		#key#:<br />
		#j[key]#<br />
		<hr />
	</cfoutput>
</cfloop>
	