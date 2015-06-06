<cfscript>
function countTrueBoolKeysInStruct(strc){
	var x = 0;
	var i = 0;
	for(i in strc) {
		if (isBoolean(strc[i]) && strc[i]){
			x++;
		}
	};
	return x;
};	
</cfscript>

<cfscript>
loc={
	trueString		= "true",
	falseString		= "false",
	trueKeyw		= true,
	falseKeyw		= false,
	positive		= 1,
	negative		= -1,
	zero			= 0,
	yes				= "yes",
	no				= "no",
	someString		= "foo"
};
</cfscript>

<cfoutput>#countTrueBoolKeysInStruct(loc)#</cfoutput>