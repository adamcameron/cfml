<cfscript>
	s = ",1;;3|||6::::";
	d = ",;|:";

	list = createObject("List").init(s, d);
	writeDump(var=[list.toString(),list.toArray()], label="default");

	list = createObject("List").init(s, d);
	list.forceVersion(6);
	writeDump(var=[list.toString(),list.toArray()], label="version 6 default");

	list = createObject("List").init(s, d, true);
	list.forceVersion(6);
	writeDump(var=[list.toString(),list.toArray()], label="version 6 empty values");

	function checkArgs(){
		writeDump(arguments);
	}
	list.each(checkArgs);
</cfscript>