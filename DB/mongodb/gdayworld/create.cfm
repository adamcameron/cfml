<cfscript>
	application.mongoConnection.createCollection("customers", {})
	customers = application.mongoConnection.getCollectionNames()
	dump(customers)
</cfscript>