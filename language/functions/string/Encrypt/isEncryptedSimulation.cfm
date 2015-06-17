<cfscript>
	param name="URL.iterations" type="integer";
	
	function makeString(length){
		var	i		= 1;
		var s		= "";
		
		for (i=1; i <= arguments.length; i++){
			s &= chr(randRange(32, 126));	
		}
		return s;
	}
	
	stResults = {good=0, bad=0, exceptions=arrayNew(1)};
	stEncodingResults = {hex=duplicate(stResults), uu=duplicate(stResults), base64=duplicate(stResults)};
	stResult = {
		CFMX_COMPAT	= duplicate(stEncodingResults),
		BLOWFISH	= duplicate(stEncodingResults),
		AES			= duplicate(stEncodingResults),
		DES			= duplicate(stEncodingResults),
		DESEDE		= duplicate(stEncodingResults)
	};
	
	aMethods 	= structKeyArray(stResult);
	aEncodings	= structKeyArray(stEncodingResults);
	
	stDedupeExcpt = structNew();

	for (i=1; i <= URL.iterations; i++){
		sRaw = makeString(512);
		sBase64 = toBase64(sRaw);
		
		for (iMethod=1; iMethod <= arrayLen(aMethods); iMethod++){
			sMethod = aMethods[iMethod];
			if (sMethod == "CFMX_COMPAT"){
				sKey = "myKey";
			}else{
				sKey = generateSecretKey(sMethod);
			}

			for (iEncoding=1; iEncoding <= arrayLen(aEncodings); iEncoding++){
				sEncoding = aEncodings[iEncoding];
				sEncoded = binaryEncode(toBinary(sBase64), sEncoding);

				try {
					//sEnc = encrypt(sRaw, sKey, sMethod, sEncoding);
					//sDec = decrypt(sEnc, sKey, sMethod, sEncoding);	
					sDec = decrypt(sEncoded, sKey, sMethod, sEncoding);	
					stResult[sMethod][sEncoding].good++;
				} catch(any e){
					stResult[sMethod][sEncoding].bad++;
					sExceptionMsg = "[#e.message#][#e.detail#]";
					if (!structKeyExists(stDedupeExcpt, hash(sMethod & sEncoding & sExceptionMsg))){
						stDedupeExcpt[hash(sMethod & sEncoding & sExceptionMsg)] = true;
						arrayAppend(stResult[sMethod][sEncoding].exceptions, sExceptionMsg);
					}
				}
			}
		}
	}
</cfscript>
<cfdump var="#stResult#">