<cfscript>
function arrayChanger(a){
	a.append("changed");
	return a;
}

std = [];
arrayChanger(std);
writeDump(std);

threadSafe = arrayNew(1, true);
arrayChanger(threadSafe);
writeDump(threadSafe);

</cfscript>