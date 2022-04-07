<cfscript>
	// load
	numbers = new DoublyLinkedList({english="one", maori="tahi"});
	numbers.append({english="two", maori="rua"});
	numbers.append({english="three", maori="toru"});
	numbers.append({english="four", maori="wha"});


	writeOutput("<h2>Traverse forwards</h2>");
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
	writeOutput("<hr />");

	writeOutput("<h2>Traverse backwards</h2>");
	numbers.afterLast();
	do {
		numbers.previous();	
		a = [
			numbers.id,
			numbers.data,
			numbers.isStartOfList()
		];
		writeDump(a);
	} while (!numbers.isStartOfList());
</cfscript>