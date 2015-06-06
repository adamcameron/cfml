<cfscript>
	collection = new Collection();
	
	c1 = new C("tahi");
	c2 = new C("rua");
	c3 = new C("toru");
	c4 = new C("wha");
	
	collection.append(c1);
	collection.append(c2);
	collection.append(c3);
	collection.append(c4);
	
	writeDump(collection.getAll());
	
</cfscript>