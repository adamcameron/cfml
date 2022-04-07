<cfscript>
	s			= "Secret";
	sKeyGood	= generateSecretKey("AES");
	sKeyBad		= generateSecretKey("AES");
	
	sEnc = encrypt(s, sKeyGood, "AES");
	sDec = decrypt(sEnc, sKeyBad, "AES");
</cfscript>
<cfdump var="#variables#">