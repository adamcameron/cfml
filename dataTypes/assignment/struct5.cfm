<cfscript>
st1 = {
	one		= "Tahi",
	two		= "TWO",
	inner	= {
		three	= "THREE",
		four	= "Wha"
	}
};
st2 = structCopy(st1);

st1.two			= "Rua";
st1.inner.three = "Toru";

writeDump(variables);
</cfscript>