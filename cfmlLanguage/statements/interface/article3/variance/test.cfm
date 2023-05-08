<cfscript>
	try {
		writeOutput("ParentImplUsingParentAndChild<br>");
		o = new ParentImplUsingParentAndChild();
		writeDump(o);
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br />");
	}
	writeOutput("<hr>");
	
	try {
		writeOutput("ParentImplUsingChildAndParent<br>");
		o = new ParentImplUsingChildAndParent();
		writeDump(o);
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br />");
	}
	writeOutput("<hr>");
	
	try {
		writeOutput("ChildImplUsingParentAndChild<br>");
		o = new ChildImplUsingParentAndChild();
		writeDump(o);
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br />");
	}
	writeOutput("<hr>");
	
	try {
		writeOutput("ChildImplUsingChildAndParent<br>");
		o = new ChildImplUsingChildAndParent();
		writeDump(o);
	}
	catch (any e){
		writeOutput("#e.message# #e.detail#<br />");
	}
	writeOutput("<hr>");
	
</cfscript>