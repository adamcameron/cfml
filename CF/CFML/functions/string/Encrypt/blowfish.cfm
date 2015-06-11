<cfscript>
	// general info
	string2encrypt	= "The quick brown fox jumps over the lazy dog";
	encKey			= "abcdefgh";


	// CF
	result.cf = encrypt(string2encrypt, encKey, "BLOWFISH", "Hex");


	// Java
	// seems to be Java equiv of the key value
	oKeySpec = createObject("java", "javax.crypto.spec.SecretKeySpec").init(encKey.getBytes(), "Blowfish");
	// do the encryption
	oCipher = createObject("java", "javax.crypto.Cipher").getInstance("Blowfish");
	oCipher.init(oCipher.ENCRYPT_MODE, oKeySpec);
	result.java.bin = oCipher.doFinal(string2encrypt.getBytes());
	// convert it to hex
	result.java.hex = binaryEncode(result.java.bin, "HEX");


	// show it
	writeDump(result);
</cfscript>

