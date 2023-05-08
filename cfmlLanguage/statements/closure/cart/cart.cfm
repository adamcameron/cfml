<cfscript>
	oCart = new Cart();
	
	// Add some items to the cart
	oCart.add('butter', 1);
	oCart.add('milk', 3);
	oCart.add('eggs', 6);
	
	//writeDump(oCart.getVariables());
	
	// Print the total with a 5% sales tax.
	writeOutput(oCart.getTotal(0.05) & "<br />");
	// The result is 54.29
</cfscript>