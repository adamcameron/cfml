<cfset encKey = GenerateSecretKey("AES")>
<form action="page2.cfm" method="post">
	<cfoutput>
		<input type="hidden" name="hdnEncType" value="#encKey#">
		Username <input type="text" name="txtUsername" value="Admin"><br>
		Password <input type="password" name="txtPassword" maxlength="10" value="#Encrypt('Test_String','#encKey#','AES','UU')#"><br>
		<input type="submit" name="st" value="Submit">
	</cfoutput>
</form>