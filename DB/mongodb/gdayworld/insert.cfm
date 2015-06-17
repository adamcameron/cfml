<cfscript>
	customers = application.mongoConnection.getCollection("customers")
	customers.insert({"id"=1,"firstName"="Zachary","lastName"="Cameron Lynch"})

	z = customers.find({"id"=1})
	writeDump(z)
</cfscript>