<cfscript>
struct function extend() {
	var extended	= {};
	var i			= 0;

	for (i=1; i <= arrayLen(arguments); i++){
		structAppend(extended, arguments[i]);
	}

	return extended;
}


result = extend({one="tahi"},{two="rua"},{three="toru"},{four="wha"});
writeDump(result);
result = extend();
writeDump(result);
result = extend({foo="bar"}, {foo="moo"});
writeDump(result);
</cfscript>
