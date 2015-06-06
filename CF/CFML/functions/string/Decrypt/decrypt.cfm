<cfscript>
	sBase	= "Wombat";
	sKey	= "Pangolin";
	sEnc = encrypt(sBase, sKey);
	sDec = decrypt(sEnc, sKey);
	writeOutput(sDec);

	for (i=1; i le len(sEnc); i=i+1){
		c = mid(sEnc, i, 1);
		writeOutput("[#i#][#c#][#asc(c)#]<br />");
	}
</cfscript>