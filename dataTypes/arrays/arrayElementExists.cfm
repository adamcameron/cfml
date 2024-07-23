<cfscript>
	a = arrayNew(1);
	a[2] = "two";
	a[4] = "four";

	function arrayElementExists(a, i){
		var stLocal = structNew();	// we need to abstract bExists into a struct so we can structKeyExists() it
		stLocal.bExists = true;
		if (i LE arrayLen(arguments.a)){
			stLocal.bExists = arguments.a.elementAt(i-1);
			return structKeyExists(stLocal, "bExists");
		}else{
			return false;
		}
	}

	for (i=1; i LE 5; i=i+1){
		b = arrayElementExists(a, i);
		writeOutput("#i#: arrayElementExists(): #b#");
		if (b){
			writeOutput("; " & a[i]);
		}
		writeOutput("<br />");
	}
</cfscript>