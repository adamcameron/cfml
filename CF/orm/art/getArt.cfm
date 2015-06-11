<cfscript>
	//aiden		= entityLoad("Artists", 1, true);
	cheapArt	= ormExecuteQuery("
		FROM Artists a
		INNER JOIN a.art b
		WITH b.price <= :price
		WHERE a.id = 1
	", {price=12000});	
	writeDump(variables);
</cfscript>

<!---

		FROM Bug b
		INNER JOIN b.accounts a
		WITH a.id = :id",

 --->