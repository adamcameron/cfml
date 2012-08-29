<cfscript>
	// load
	numbers = new LinkedList({english="one", maori="tahi"});
	numbers.append({english="two", maori="rua"});
	numbers.append({english="three", maori="toru"});
	numbers.append({english="four", maori="wha"});


	numbers.beforeFirst();
	do {
		numbers.next();	
		a = [
			numbers.id,
			numbers.data,
			numbers.isEndOfList()
		];
		writeDump(a);
	} while (!numbers.isEndOfList());
</cfscript>