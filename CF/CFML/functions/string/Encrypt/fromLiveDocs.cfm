<h3>Encrypt Example</h3>
<!--- Do the following if the form has been submitted. --->
<cfif IsDefined("Form.myString")>
	<cfscript>
		/* GenerateSecretKey does not generate key for the CFMX_COMPAT algorithm,
		so use the key from the form.
		*/
		if (Form.myAlgorithm EQ "CFMX_COMPAT")
			theKey=Form.MyKey;
		// For all other encryption techniques, generate a secret key.
		else
			theKey=generateSecretKey(Form.myAlgorithm);
		//Encrypt the string
		encrypted=encrypt(Form.myString, theKey, Form.myAlgorithm, Form.myEncoding);
		//Decrypt it
		decrypted=decrypt(encrypted, theKey, Form.myAlgorithm, Form.myEncoding);
	</cfscript>

	<!--- Display the values used for encryption and decryption,
			and the results. --->
	<cfoutput>
		<strong>The algorithm:</strong> #Form.myAlgorithm#<br />
		<strong>The key:</strong> #theKey#<br />
		<br />
		<strong>The string:</strong> #Form.myString# <br />
		<br />
		<strong>Encrypted:</strong> #encrypted#<br />
		<br />
		<strong>Decrypted:</strong> #decrypted#<br />
	</cfoutput>
</cfif>

<cfparam name="form.myEncoding" default="UU">
<cfparam name="form.myAlgorithm" default="CFMX_COMPAT">
<cfparam name="form.myKey" default="MyKey">
<cfparam name="form.myString" default="This string will be encrypted (you can replace it with more typing).">
<!--- The input form.--->
<cfoutput>
<form action="#CGI.SCRIPT_NAME#" method="post">
	<strong>Select the encoding</strong><br />
	<select size="1" name="myEncoding">
		<cfloop index="sEnc" list="UU,Base64,Hex">
			<option<cfif sEnc eq form.myEncoding> selected="selected"</cfif>>#sEnc#</option>
		</cfloop>
	</select><br />
	<br />
	<strong>Select the algorithm</strong><br />
	<select size="1" name="myAlgorithm">
		<cfloop index="sAlg" list="CFMX_COMPAT,AES,DES,DESEDE">
			<option<cfif sAlg eq form.myAlgorithm> selected="selected"</cfif>>#sAlg#</option>
		</cfloop>
	</select><br />
	<br />
	<strong>Input your key</strong> (used for CFMX_COMPAT encryption only)<br />
	<input type="text" name="myKey" value="#form.myKey#" /><br />
	<br />
	<strong>Enter string to encrypt</strong><br />
	<textarea name="myString" cols="40" rows="5" wrap="VIRTUAL">#form.myString#</textArea><br />
	<input type = "Submit" value = "Encrypt my String &raquo;" />
</form>
</cfoutput>