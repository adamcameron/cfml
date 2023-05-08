<cfscript>
	function f(){
		var a = "";
		writeDump(getPageContext().getActiveFunctionLocalScope());
		writeOutput("isDefined(): #isDefined("b")#<br>");
		writeOutput("structKeyExists(): #structKeyExists(local, "b")#<br>");
		writeOutput("isNull(): #isNull(b)#<br>");
		writeOutput("isNull(): #isNull(c)#<br>");
		var b = "value";
	}


	f();
</cfscript>