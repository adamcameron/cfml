<cfscript>
	a = arrayNew(1);
	a[1]	= "aardvark";
	a[3]	= "cheetah";
	a[5]	= "echidna";
	a[7]	= "goose";

	for (i=1; i le arrayLen(a); i=i+1){
		b = a.elementAt(javacast("int", i-1));
		if (structKeyExists(variables, "b")){
			writeOutput("a[#i#] exists: [#a[i]#]<br />");
		}else{
			writeOutput("a[#i#] is not defined<br />");
		}
	}
</cfscript>

<cfdump var="#a#">