<cfscript>
form.dotNotation = 0;
form['associativeArrayNotation'] = 0;
noScope = 0;
param name="form.scopedParam" default=0;
structInsert(form, "structInsert", 0, true);
</cfscript>
<cfparam name="form.scopedCfParam" default="0">
<cfset form.scopedCfSet = 0>

<cfset j.direct = serializeJson(form)>

<cfscript>
form.subStruct = {};
form.subStruct.dotNotation = 0;
form.subStruct['associativeArrayNotation'] = 0;
param name="form.subStruct.scopedParam" default=0;
structInsert(form.subStruct, "structInsert", 0, true);
</cfscript>
<cfparam name="form.subStruct.scopedCfParam" default="0">
<cfset form.subStruct.scopedCfSet = 0>

<cfset j.subStruct = serializeJson(form.subStruct)>

Form Scope<br />
<cfloop collection="#j#" item="key">
	<cfoutput>
		#key#:<br />
		#j[key]#<br />
		<hr />
	</cfoutput>
</cfloop>
	
	