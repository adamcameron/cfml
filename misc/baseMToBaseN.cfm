<cfscript>
/**
@hint Converts a number from one arbitrary base to another arbitrary base.  Is not restricted to bases that Java and CF natively support in their equivalent built-in functions. The internal maths are restricted to the bounds of java.math.BigInteger though.
@number The number to convert.
@fromBase The base to convert from.  Can either be one of BIN, DEC, HEX, BASE36, BASE62 or an 'alphabet' or characters that represent the digits. EG: OCTAL would be 01234567.
@toBase The base to convert to. Has same value rules as fromBase.
*/
string function baseMToBaseN(required string number, required string fromBase, required string toBase){
	if (fromBase == toBase){	// ie: there's nothing to do
		return number;
	}
	
	// I use BigIntegers in this because CF loses precision or overflows pretty quickly
	var getDigitsForBase = function(base){// abstracting this out because it's verbose and I need to do it twice 
		var result = {};
		switch (base){
			case "BIN":		result.digits="01"; break;
			case "DEC":		result.digits="0123456789"; break;
			case "HEX":		result.digits="0123456789ABCDEF"; break;
			case "BASE36":	result.digits="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"; break;
			case "BASE62":	result.digits="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"; break;
			default:		result.digits=base; break;
		}
		result.base = createObject("java", "java.math.BigInteger").init(javaCast("String", len(result.digits)));
		return result;
	};

	var from			= getDigitsForBase(fromBase); 
	var to				= getDigitsForBase(toBase); 
	var srcDigits		= reverse(number);
	var digit			= "";
	var baseMultiplier	= createObject("java", "java.math.BigInteger").init("1");	// NB: BigInteger inits with a string, hence the quotes
	var digitMultiplied	= 0;
	var digitValue		= 0;
	var decValue		= createObject("java", "java.math.BigInteger").init("0");
	var result			= "";
	
	// the first step is converting the number to decimal. If it's already a decimal, we can skip this bit
	if (fromBase == "DEC"){
		decValue		= createObject("java", "java.math.BigInteger").init(javaCast("String", number));
	}else{
		while (len(srcDigits) > 0){	// the algorithm is basically go through each digit, and multiple it by increasing powers of the base we're converting to
			// get the next char and its value
			digit			= left(srcDigits, 1);
			digitValue		= createObject("java", "java.math.BigInteger").init(javaCast("String", find(digit, from.digits) - 1));

			// add it to the total
			digitMultiplied = baseMultiplier.multiply(digitValue);
			decValue		= decValue.add(digitMultiplied);

			// get ready for next iteration
			srcDigits		= removeChars(srcDigits, 1, 1);
			baseMultiplier = baseMultiplier.multiply(from.base);
		}
	}

	// convert from a decimal into the specified base: progressively note the remainder as we divide the number by the base
	while (decValue >= to.base){
		digitValue	= decValue.mod(to.base);
		digit		= mid(to.digits, digitValue+1, 1);
		result		= digit & result;
		decValue	= decValue.divide(to.base);
	}
	
	// and do the last digit, which is all that is left after the loop
	digit	= mid(to.digits, decValue+1, 1);
	result	= digit & result;
	
	return result;
}


	// testing

	test.description	= "A fairly easy to visually-test example";
	test.number			= 255;
	test._baseFrom		= "dec";
	test._baseTo		= "bin";
	test._result		= baseMToBaseN(test.number, test._baseFrom, test._baseTo);
	writeDump(test);

	test.description 	= "Another one";
	test.number			= "FFFF";
	test._baseFrom		= "hex";
	test._baseTo		= "dec";
	test._result		= baseMToBaseN(test.number, test._baseFrom, test._baseTo);
	writeDump(test);

	test.description 	= "Using a bespoke 'alphabet' (OCTAL in this case)";
	test.number			= 123;
	test._baseFrom		= "01234567";	// ie: octal
	test._baseTo		= "dec";
	test._result		= baseMToBaseN(test.number, test._baseFrom, test._baseTo);
	writeDump(test);

	test.description 	= "Another one using a bespoke 'alphabet' (this is URL safe)";
	test.number			= replace(createUuid(), "-", "", "ALL");
	test._baseFrom		= "hex";
	test._baseTo		= "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-._~";	// safe for a URL
	test._result		= baseMToBaseN(test.number, test._baseFrom, test._baseTo);
	writeDump(test);

	test.description 	= "Converting to/from the same base";
	test.number			= replace(createUuid(), "-", "", "ALL");
	test._baseFrom		= "hex";
	test._baseTo		= "hex";	// safe for a URL
	test._result		= baseMToBaseN(test.number, test._baseFrom, test._baseTo);
	writeDump(test);


	test.description 	= "Multi-step proof it all works correctly: 1) from a GUID to BASE62";
	test.number			= replace(createUuid(), "-", "", "ALL");
	test._baseFrom		= "hex";
	test._baseTo		= "base62";
	test._result		= baseMToBaseN(test.number, test._baseFrom, test._baseTo);
	writeDump(test);

	test.description 	= "Multi-step proof it all works correctly: 2) from BASE62 to BINARY";
	test.number			= test._result;
	test._baseFrom		= "base62";
	test._baseTo		= "bin";
	test._result		= baseMToBaseN(test.number, test._baseFrom, test._baseTo);
	writeDump(test);

	test.description 	= "Multi-step proof it all works correctly: 3) from BINARY back to the original HEX";
	test.number			= test._result;
	test._baseFrom		= "bin";
	test._baseTo		= "hex";
	test._result		= baseMToBaseN(test.number, test._baseFrom, test._baseTo);
	writeDump(test);
</cfscript>