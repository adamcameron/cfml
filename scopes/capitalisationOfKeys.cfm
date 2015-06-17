<cfapplication name="app#createUuid()#" sessionmanagement="true"> 

<cfscript>
variables.dotNotation = 0;
variables['associativeArrayNotation'] = 0;
noScope = "no scope";
structInsert(variables, "structInsert", 0, true);
j.variables = serializeJson(variables);

st.dotNotation = 0;
st['associativeArrayNotation'] = 0;
structInsert(st, "structInsert", 0, true);
j.st = serializeJson(st);

request.dotNotation = 0;
request['associativeArrayNotation'] = 0;
structInsert(request, "structInsert", 0, true);
j.request = serializeJson(request);

session.dotNotation = 0;
session['associativeArrayNotation'] = 0;
structInsert(session, "structInsert", 0, true);
j.session = serializeJson(session);

application.dotNotation = 0;
application['associativeArrayNotation'] = 0;
structInsert(application, "structInsert", 0, true);
j.application = serializeJson(application);

server.dotNotation = 0;
server['associativeArrayNotation'] = 0;
structInsert(server, "structInsert", 0, true);
j.server = serializeJson(server);
</cfscript>

<table border="1">
<tr>
	<td>Variable/scope</td>
	<td>JSON</td>
</tr>
<cfloop collection="#j#" item="key">
	<tr>
		<cfoutput>
			<td>#key#</td>
			<td>#j[key]#</td>
		</cfoutput>
	</tr>
</cfloop>
</table>
	