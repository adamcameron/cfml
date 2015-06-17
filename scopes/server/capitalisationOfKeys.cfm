<cfscript>
server.dotNotation = 0;
server['associativeArrayNotation'] = 0;
noScope = 0;
param name="server.scopedParam" default=0;
structInsert(server, "structInsert", 0, true);
</cfscript>
<cfparam name="server.scopedCfParam" default="0">
<cfset server.scopedCfSet = 0>

<cfset j.direct = serializeJson(server)>

<cfscript>
server.subStruct = {};
server.subStruct.dotNotation = 0;
server.subStruct['associativeArrayNotation'] = 0;
param name="server.subStruct.scopedParam" default=0;
structInsert(server.subStruct, "structInsert", 0, true);
</cfscript>
<cfparam name="server.subStruct.scopedCfParam" default="0">
<cfset server.subStruct.scopedCfSet = 0>

<cfset j.subStruct = serializeJson(server.subStruct)>

Server Scope<br />
<cfloop collection="#j#" item="key">
	<cfoutput>
		#key#:<br />
		#j[key]#<br />
		<hr />
	</cfoutput>
</cfloop>
	
	