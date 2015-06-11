<cfscript>
	sMsg = "Here's a sentence I wish to encrypt";
	sKey = "===encrypt_with_this===";
	sEncNoEncoding = encrypt(sMsg, sKey);
	sEncWithEncoding = encrypt(sMsg, sKey, "CFMX_COMPAT", "HEX");

	sDecNoEncoding = decrypt(sEncNoEncoding, sKey);
	sDecWithEncoding = decrypt(sEncWithEncoding, sKey, "CFMX_COMPAT", "HEX");
</cfscript>

<cfdump var="#variables#">