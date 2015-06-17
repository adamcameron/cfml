<cfscript>
st1 = {
	one		= "Tahi",
	two		= "TWO",
	three	= "Toru",
	four	= "Wha"
};
st2 = f(st1);

function f(st){
	st.two = "Rua";
	return st;
};

writeDump(variables);
</cfscript>