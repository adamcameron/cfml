<cfset encKey = GenerateSecretKey("AES")>
<cfset sPwd = "letmein">

<form method="post" action="./frm.cfm">
<cfoutput>
	<input type="text" name="hdnEncType" value="#encKey#" /><br />
	<input type="password" name="txtPassword" value="#Encrypt(sPwd, encKey,'AES','UU')#" /><br />
	
	<input type="submit" name="btnSubmit" value="Go &raquo;" />
</cfoutput>
</form>
<cfif structKeyExists(form, "btnSubmit")>
	<cfset decryptedPassword = Decrypt(FORM.txtPassword, FORM.hdnEncType, "AES", "UU")>
	<cfoutput>[#decryptedPassword#]</cfoutput>
</cfif> 