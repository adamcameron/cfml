<cfscript>
// dumpThis.cfm

o = new C();

dumpThis = function (){
	cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
	writeOutput("<pre>#cv.viewObject(this)#</pre>");
	writeDump(var=this.keys());
};

o.dumpThis = dumpThis;
o.dumpThis();
</cfscript>