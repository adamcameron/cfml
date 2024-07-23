<cfscript>
	sIv =  '12345678';
	
	//sKey256 = '1234567890123456ABCDEFGHIJKLMNOP';
	//sKey128 = '1234567890123456';
	sKey256 = '1234567812345678';
	sKey128 = '12345678';
	
	writeOutput("iv: #sIv#<br />");
	writeOutput("key256: #sKey256#<br />");
	writeOutput("key128: #sKey128#<br />");
	
	sClearText = 'The quick brown fox jumped over the lazy dog';
	writeOutput("clearText: #sClearText#<br /><br />");
		
	sCipherText = encrypt(sClearText, sKey256, "BLOWFISH", "Hex", sIv);
	writeOutput("256-bit blowfish encrypted:<br />#sCipherText#<br /><br />");

	sCipherText = encrypt(sClearText, sKey128, "BLOWFISH", "Hex", sIv);
	writeOutput("128-bit blowfish encrypted:<br />#sCipherText#<br /><br />");
</cfscript>
