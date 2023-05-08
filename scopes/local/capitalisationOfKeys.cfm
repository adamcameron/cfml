<cffunction name="f">
	<cfscript>
	local.dotNotation = 0;
	local['associativeArrayNotation'] = 0;
	noScope = 0;
	param name="local.scopedParam" default=0;
	structInsert(local, "structInsert", 0, true);
	</cfscript>
	<cfparam name="local.scopedCfParam" default="0">
	<cfset local.scopedCfSet = 0>
	
	<cfset j.direct = serializeJson(local)>
	
	<cfscript>
	local.subStruct = {};
	local.subStruct.dotNotation = 0;
	local.subStruct['associativeArrayNotation'] = 0;
	param name="local.subStruct.scopedParam" default=0;
	structInsert(local.subStruct, "structInsert", 0, true);
	</cfscript>
	<cfparam name="local.subStruct.scopedCfParam" default="0">
	<cfset local.subStruct.scopedCfSet = 0>
	
	<cfset j.subStruct = serializeJson(local.subStruct)>
	
	Local Scope<br />
	<cfloop collection="#j#" item="key">
		<cfoutput>
			#key#:<br />
			#j[key]#<br />
			<hr />
		</cfoutput>
	</cfloop>
</cffunction>
<cfset f()>