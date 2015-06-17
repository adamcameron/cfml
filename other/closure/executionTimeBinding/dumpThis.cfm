<cfscript>
// dumpThis.cfm

o = new C();

dumpThis = function (){
	cv = createObject("java", "ClassViewer");
	writeOutput("<pre>#cv.viewObject(this)#</pre>");
	writeDump(var=this.keys());
};

o.dumpThis = dumpThis;
o.dumpThis();
</cfscript>