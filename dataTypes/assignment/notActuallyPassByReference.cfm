<cfscript>
st1 = {
	one		= "Tahi",
	two		= "Rua",
	three	= "Toru",
	four	= "Wha"
};
st2 = f(st1);

function f(st){
	st = {
		one		= "Ichi",
		two		= "Ni",
		three	= "San",
		four	= "Shi"
	};
	return st;
};

writeDump(variables.st1);
writeDump(variables.st2);
</cfscript>