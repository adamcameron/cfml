<cfscript>
i=0;
cfloop(file=expandPath("./file.dat"), index="chars", characters=64, charset="UTF-8"){
	writeOutput("#++i#: #chars#<br>");
}
</cfscript>