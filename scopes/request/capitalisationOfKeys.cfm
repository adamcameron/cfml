<cfscript>
request.dotNotation = 0;
request['associativeArrayNotation'] = 0;
param name="request.scopedParam" default=0;
structInsert(request, "structInsert", 0, true);
</cfscript>
<cfparam name="request.scopedCfParam" default="0">
<cfset request.scopedCfSet = 0>

<cfset j.direct = serializeJson(request)>

<cfscript>
request.subStruct = {};
request.subStruct.dotNotation = 0;
request.subStruct['associativeArrayNotation'] = 0;
param name="request.subStruct.scopedParam" default=0;
structInsert(request.subStruct, "structInsert", 0, true);
</cfscript>
<cfparam name="request.subStruct.scopedCfParam" default="0">
<cfset request.subStruct.scopedCfSet = 0>

<cfset j.subStruct = serializeJson(request.subStruct)>

Request Scope<br />
<cfloop collection="#j#" item="key">
	<cfoutput>
		#key#:<br />
		#j[key]#<br />
		<hr />
	</cfoutput>
</cfloop>
	
	