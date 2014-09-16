<cfscript>
transaction {
	try {
		// stuff to do
		transaction action="commit";
	}
	catch (any e){
		transaction action="rollback";	
	}
}

</cfscript>