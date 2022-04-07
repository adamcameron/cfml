<cfscript>
	userService = new service.User();

	if (CGI.request_method EQ "POST"){
		updatedUser = userService.update(argumentCollection=form);
	}
	users = userService.getAll();

	properties = ['id','firstName','lastName','age'];
</cfscript>
<cfoutput>
<table>
	<thead>
	<tr>
		<cfloop index="property" array="#properties#">
			<td>#property#</td>
		</cfloop>
		<td>&nbsp;</td>
	</tr>
	</thead>
	<tbody>
	<cfloop index="user" array="#users#">
	<form method="post">
		<tr>
			<cfloop index="property" array="#properties#">
				<cfset methodName = "get#property#">
				<td><input name="#property#" value="#invoke(user,methodName)#"></td>
			</cfloop>
			<td><input type="submit" value="Submit"></td>
		</tr>
	</form>
	</cfloop>
	</tbody>
</table>
</cfoutput>