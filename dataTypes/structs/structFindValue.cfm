<cfxml variable="x">
	<doc>
		<key>data</key>
		<key>data</key>
		<key>data</key>
	</doc>

</cfxml>



<cfscript>
	oCFML = createObject("component", "cfml");
	function structBuild(){return arguments;}
	s = structBuild(top1="A", top2=structBuild(next1="B", next2="C", next3=structBuild(middle1="A", middle2="B")), top3=structBuild(next1="C", next2=structBuild(middle1="A", middle2="B", middle3=structBuild(bottom1="C", bottom2="A", bottom3="B"))));

	w = oCFML.cfWDDX(action="cfml2wddx", input=x);
	
//	oCFML.cfDump(s);
	oCFML.cfDump(structFindKey(w, "key", "ALL"));
	oCFML.cfDump(structFindValue(w, "data", "ALL"));
</cfscript>

