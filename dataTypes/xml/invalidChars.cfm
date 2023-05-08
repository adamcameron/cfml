<cfflush interval="128">

<cfscript>
	// http://www.w3.org/TR/2006/REC-xml11-20060816/#NT-RestrictedChar
	lChars="1-8,B-C,E-1F,7F-84,86-9F,FDD0-FDDF,1FFFE-1FFFF,2FFFE-2FFFF,3FFFE-3FFFF,4FFFE-4FFFF,5FFFE-5FFFF,6FFFE-6FFFF,7FFFE-7FFFF,8FFFE-8FFFF,9FFFE-9FFFF,AFFFE-AFFFF,BFFFE-BFFFF,CFFFE-CFFFF,DFFFE-DFFFF,EFFFE-EFFFF,FFFFE-FFFFF,10FFFE-10FFFF";
	sRaw = "<node>{char}</node>";
	sCData = "<node><![CDATA[{char}]]></node>";

	function unescaped(i){
		return chr(i);
	}

	function xmlFormatted(i){
		return xmlFormat(chr(i));
	}
	lFunctions = "unescaped,xmlFormatted";
	lVariations= "raw,cdata";

	stResult = structNew();
	stResult.total = 0;

	for (iFunction=1; iFunction <= listLen(lFunctions); iFunction++){
		sFunction = listGetAt(lFunctions, iFunction);
		stResult[sFunction] = structNew();
		for (iVariation=1; iVariation <= listLen(lVariations); iVariation++){
			sVariation = listGetAt(lVariations, iVariation);
			stResult[sFunction][sVariation] = structNew();
			stResult[sFunction][sVariation].pass = 0;
			stResult[sFunction][sVariation].fail = 0;
			stResult[sFunction][sVariation].passed = "";
			stResult[sFunction][sVariation].failed = "";

			writeOutput("Processing: [#sFunction#][#sVariation#] <br />");
			for (iChars=1; iChars <= listLen(lChars); iChars++){
				sRange = listGetAt(lChars, iChars);
				iLow = inputBaseN(listFirst(sRange, "-"), 16);
				iHigh = inputBaseN(listLast(sRange, "-"), 16);

				for (i=iLow; i <= iHigh; i++){
					stResult.total++;
					fnTemp = variables[sFunction];
					c = fnTemp(i);
					try {
						sDoc = replace(variables["s" & sVariation], "{char}", c, "ONE");
						xDoc = xmlParse(sDoc);
						stResult[sFunction][sVariation].pass++;
						stResult[sFunction][sVariation].passed = listAppend(stResult[sFunction][sVariation].passed, i);
					} catch(any e){
						stResult[sFunction][sVariation].failed = listAppend(stResult[sFunction][sVariation].failed, i);
						stResult[sFunction][sVariation].fail++;
					}
				}// end of range loop
			}// end of list loop
		}	// end of variation loop
	}	// end of function loop
</cfscript>
<cfdump var="#stResult#">