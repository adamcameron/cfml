<cfscript>
// component.cfm
o1 = new C();
o2 = o1;

o1.two = "Rua";

writeDump(o1);
writeDump(o2);	// doing them separately to prevent CF "helpfully" suppressing o2's dump because it's the same object as o1
</cfscript>