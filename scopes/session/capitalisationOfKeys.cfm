<cfapplication name="app#createUuid()#" sessionmanagement="true"> 

<cfscript>
session.dotNotation = 0;
session['associativeArrayNotation'] = 0;
noScope = 0;
param name="session.scopedParam" default=0;
structInsert(session, "structInsert", 0, true);
</cfscript>
<cfparam name="session.scopedCfParam" default="0">
<cfset session.scopedCfSet = 0>

<cfset j.direct = serializeJson(session)>

<cfscript>
session.subStruct = {};
session.subStruct.dotNotation = 0;
session.subStruct['associativeArrayNotation'] = 0;
param name="session.subStruct.scopedParam" default=0;
structInsert(session.subStruct, "structInsert", 0, true);
</cfscript>
<cfparam name="session.subStruct.scopedCfParam" default="0">
<cfset session.subStruct.scopedCfSet = 0>

<cfset j.subStruct = serializeJson(session.subStruct)>

Session Scope<br />
<cfloop collection="#j#" item="key">
	<cfoutput>
		#key#:<br />
		#j[key]#<br />
		<hr />
	</cfoutput>
</cfloop>
	
	