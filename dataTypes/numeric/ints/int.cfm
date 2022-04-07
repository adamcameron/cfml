<cfscript>
f = -37.9;
viaJavaCast = javaCast("int", f);
viaIntValue = f.intValue();
intInt = int(f);
writeDump(variables);
</cfscript>