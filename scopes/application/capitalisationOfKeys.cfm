<cfapplication name="app#createUuid()#" sessionmanagement="true"> 

<cfscript>
application.dotNotation = 0;
application['associativeArrayNotation'] = 0;
noScope = 0;
param name="application.scopedParam" default=0;
structInsert(application, "structInsert", 0, true);
</cfscript>
<cfparam name="application.scopedCfParam" default="0">
<cfset application.scopedCfSet = 0>

<cfset j.direct = serializeJson(application)>

<cfscript>
application.subStruct = {};
application.subStruct.dotNotation = 0;
application.subStruct['associativeArrayNotation'] = 0;
param name="application.subStruct.scopedParam" default=0;
structInsert(application.subStruct, "structInsert", 0, true);
</cfscript>
<cfparam name="application.subStruct.scopedCfParam" default="0">
<cfset application.subStruct.scopedCfSet = 0>

<cfset j.subStruct = serializeJson(application.subStruct)>

Application Scope<br />
<cfloop collection="#j#" item="key">
	<cfoutput>
		#key#:<br />
		#j[key]#<br />
		<hr />
	</cfoutput>
</cfloop>
	
	