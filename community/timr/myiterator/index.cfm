<cfscript>
q = QueryNew("id,name", "integer,varchar", [
	[1, "Hello"],
	[2, "World"]
]);

a = new QueryIterator(q);
writeDump(a.isEmpty());

q = QueryNew("id,name", "integer,varchar");
b = new QueryIterator(q);
writeDump(b.isEmpty());
</cfscript>
