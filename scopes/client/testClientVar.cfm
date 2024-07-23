<cfapplication clientmanagement="true" name="clientVarTest">
<cfset client.foo = "bar">
<cfdump var="#client#">