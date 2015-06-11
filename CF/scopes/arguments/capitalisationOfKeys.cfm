<cffunction name="f">
	<cfscript>
	arguments.dotNotation = 0;
	arguments['associativeArrayNotation'] = 0;
	param name="arguments.scopedParam" default=0;
	structInsert(arguments, "structInsert", 0, true);
	</cfscript>
	<cfparam name="arguments.scopedCfParam" default="0">
	<cfset arguments.scopedCfSet = 0>
	
	<cfset j.direct = serializeJson(arguments)>
	
	<cfscript>
	arguments.subStruct = {};
	arguments.subStruct.dotNotation = 0;
	arguments.subStruct['associativeArrayNotation'] = 0;
	param name="arguments.subStruct.scopedParam" default=0;
	structInsert(arguments.subStruct, "structInsert", 0, true);
	</cfscript>
	<cfparam name="arguments.subStruct.scopedCfParam" default="0">
	<cfset arguments.subStruct.scopedCfSet = 0>
	
	<cfset j.subStruct = serializeJson(arguments.subStruct)>
	
	Arguments Scope<br />
	<cfloop collection="#j#" item="key">
		<cfoutput>
			#key#:<br />
			#j[key]#<br />
			<hr />
		</cfoutput>
	</cfloop>
</cffunction>
<cfset f()>