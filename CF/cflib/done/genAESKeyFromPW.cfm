<cffunction name="genAESKeyFromPW1" access="public" returnType="string">
	<cfargument name="password" type="string" required="true" />
	<cfargument name="salt64" type="string" required="true" />
	<cfargument name="length" type="numeric" required="true" default="128" />
	<!--- Decode the salt value that was provided. --->
	<cfset var salt = toString(toBinary(arguments.salt64)) />
	<!--- Go fetch Java's secret key factory so we can generate a key. --->
	<cfset var keyFactory = createObject("java", "javax.crypto.SecretKeyFactory").getInstance("PBKDF2WithHmacSHA1") />
	<!--- Define a key specification based on the password and salt that were provided. --->
	<cfset var keySpec = createObject("java", "javax.crypto.spec.PBEKeySpec").init(
			arguments.password.toCharArray(),		<!--- Convert the password to a character array (char[])--->
			salt.getBytes(),										<!--- Convert the salt to a byte array (byte[]) --->
			javaCast("int", 1024),							<!--- Iterations as Java int --->
			javaCast("int", arguments.length)		<!--- Key length as Java int (192 or 256 may be available depending on your JVM) --->
	) />
	<!--- Initialize the secret key based on the password/salt specification. --->
	<cfset var tempSecret = keyFactory.generateSecret(keySpec) />
	<!--- Generate the AES key based on our secret key. --->
	<cfset var secretKey = createObject("java", "javax.crypto.spec.SecretKeySpec").init(tempSecret.getEncoded(), "AES") />
	<!--- Return the generated key as a Base64-encoded string. --->
	<cfreturn toBase64(secretKey.getEncoded()) />	
</cffunction>

<cfscript>
string function genAESKeyFromPW(required string password, required string salt64, numeric length=128){
	// Decode the salt value that was provided.
	var salt = toString(toBinary(arguments.salt64));
	
	// Go fetch Java's secret key factory so we can generate a key.
	var keyFactory = createObject("java", "javax.crypto.SecretKeyFactory").getInstance("PBKDF2WithHmacSHA1");
	
	// Define a key specification based on the password and salt that were provided.
	var keySpec = createObject("java", "javax.crypto.spec.PBEKeySpec").init(
		arguments.password.toCharArray(),	// Convert the password to a character array (char[])
		salt.getBytes(),					// Convert the salt to a byte array (byte[])
		javaCast("int", 1024),				// Iterations as Java int
		javaCast("int", arguments.length)	// Key length as Java int (192 or 256 may be available depending on your JVM)
	);
	
	// Initialize the secret key based on the password/salt specification.
	var tempSecret = keyFactory.generateSecret(keySpec);

	// Generate the AES key based on our secret key.
	var secretKey = createObject("java", "javax.crypto.spec.SecretKeySpec").init(tempSecret.getEncoded(), "AES");

	// Return the generated key as a Base64-encoded string.
	return toBase64(secretKey.getEncoded());	
}
</cfscript>



<!--- Standard key generation method, generates a random AES key. --->
<cfset generatedKey = generateSecretKey("AES") />


<!--- Password method, generates an AES key based on a password and salt. --->

<!--- User would provide their encryption password to the system. --->
<!--- Password is case-sensitive and could be passed through LCase() or UCase() to negate case. --->
<cfset myPassword = "secret password" />

<!--- The system would generate a salt in Base64 for their account and store it along with their account information. --->
<!--- The salt is used by the key generator to help mitigate against dictionary attacks and is required. --->
<!--- It's recommended to use a salt generated based on Java's SecureRandom object. --->
<cfset mySalt64 = toBase64("some salt value") />

<!--- Call the password-based key generator with the password and salt. --->
<cfset generatedKey = genAESKeyFromPW(myPassword, mySalt64) />

<!--- The generated key drops right in where a key from generateSecretKey("AES) would go. ---> 
<cfset encrypted = encrypt("Hello World!", generatedKey, "AES", "Base64") />

<p><cfoutput>encrypted: #encrypted#</cfoutput></p>

<!--- Decryption works the same way. --->
<cfset decrypted = decrypt(encrypted, generatedKey, "AES", "Base64") />

<p><cfoutput>decrypted: #decrypted#</cfoutput></p>
