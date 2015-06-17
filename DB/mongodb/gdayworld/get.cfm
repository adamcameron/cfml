<cfscript>
	customers = application.mongoConnection.getCollection("customers")
	z = customers.find({"id"=1}).toArray()
	dump(z)
</cfscript>