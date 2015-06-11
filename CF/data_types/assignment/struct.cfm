<cfscript>
st1 = {
	one		= "Tahi",
	two		= "TWO",
	three	= "Toru",
	four	= "Wha"
};
st2 = st1;

st1.two = "Rua";

writeDump(variables);
</cfscript>