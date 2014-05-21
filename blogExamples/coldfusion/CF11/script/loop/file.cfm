<cfscript>
i=0;
cfloop(file=expandPath("./file.dat"), index="line", charset="UTF-8"){
	writeOutput("#++i#: #line#<br>");
}
</cfscript>