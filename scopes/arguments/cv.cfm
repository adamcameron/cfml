<cfscript>
	function f(){
		writeOutput("<pre>#createObject('java', 'ClassViewer').viewObject(arguments)#</pre>");
	}
	f();
</cfscript>