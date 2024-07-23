<cfscript>
st1 = {
	one		= "Tahi",
	two		= "TWO",
	three	= "Toru",
	four	= "Wha"
};

a = structFindKey(st1, "two");
a[1].owner.two = "Rua";

writeDump(variables);
</cfscript>