<cfscript>
// structGet.cfm

base = {a={b={c="d"}}};
writeDump(base);

gotViaFunction = structGet("base.a.b");
writeDump(gotViaFunction);

try {
	gotViaMethod = base.get(".a.b");
	writeDump(gotViaMethod);
}
catch (any e){
	writeDump([e.type,e.message,e.detail]);
}
</cfscript>