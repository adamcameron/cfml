<cfscript>
// test.cfm

function f(x) access="private" returntype="void" hint="hint for function f()" {

}


writeDump(f);
writeDump(getMetadata(f));
f();
</cfscript>