<cfscript>
st1 = {
	inner1 = {
		one = "Tahi"
	}
};
st1.inner2 = st1.inner1;	// so those two references are pointing to the same struct in memory

st2 = st1;

st1.inner1.two = "Rua";

//writeDump(variables);		// note that TWO has been set into both inner1 and inner2


st3 = duplicate(st1);		// make a proper value-based copy; so completely different references pointing to different bits of memory

st3.inner1.three = "Toru";

writeDump(variables);		// inner2 also had a copy of "THREE"
</cfscript>