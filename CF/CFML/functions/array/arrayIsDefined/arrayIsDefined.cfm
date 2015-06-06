<cfscript>
	a = arrayNew(1);
	a[1] = "one";
	a[3] = "three";

	writeOutput("arrayIsDefined(a, 1): [#arrayIsDefined(a, 1)#]<br />");
	writeOutput("arrayIsDefined(a, 2): [#arrayIsDefined(a, 2)#]<br />");
	writeOutput("arrayIsDefined(a, 3): [#arrayIsDefined(a, 3)#]<br />");

	try {
		writeOutput("arrayIsDefined(a, 4): [#arrayIsDefined(a, 4)#]<br />");
	} catch(any e){
		writeOutput("arrayIsDefined(a, 4): [#e.message#][#e.detail#]<br />");
	}

	a[5] = "five";
	writeOutput("arrayIsDefined(a, 4): [#arrayIsDefined(a, 4)#]<br />");
</cfscript>

<cfscript>
	s = "not an array";
	b = arrayIsDefined("s");	// b is false because whilst s exists, it's not an array

	// n = "the variable n is not set at all";
	b = arrayIsDefined("n");	// b is false because n isn't set at all

	a = arrayNew(1);
	b = arrayIsDefined("s");	// hurrah! b is true because a actually is an array
</cfscript>

