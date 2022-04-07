<cfscript>
	writeOutput("<h1>LinkedList.cfc demo</h1>");
	// init

	writeOutput("<h2>init() & listToArray()</h2>");
	maoriNumbers = new LinkedList({four="Wha"});
	
	// listToArray
	writeDump(var=maoriNumbers.listToArray(), label="init() Wha");
	writeOutput("<hr />");
	
	// append
	writeOutput("<h2>append()</h2>");
	maoriNumbers.append({five="Rima"});
	writeDump(var=maoriNumbers.listToArray(), label="append() Rima");
	writeOutput("<hr />");
	
	// prepend
	writeOutput("<h2>prepend()</h2>");
	maoriNumbers.prepend({three="Toru"});
	writeDump(var=maoriNumbers.listToArray(), label="prepend() Toru");
	writeOutput("<hr />");
	
	// insertBefore
	writeOutput("<h2>insertBefore()</h2>");
	maoriNumbers.insertBefore({one="Tahi"});
	writeDump(var=maoriNumbers.listToArray(), label="insertBefore() Tahi");
	writeOutput("<hr />");
	
	// insertAfter
	writeOutput("<h2>insertAfter()</h2>");
	maoriNumbers.insertAfter({two="Rua"});
	writeDump(var=maoriNumbers.listToArray(), label="insertAfter() Rua");
	writeOutput("<hr />");
	
	// delete
	writeOutput("<h2>delete()</h2>");
	maoriNumbers.last();
	maoriNumbers.delete();
	writeDump(var=maoriNumbers.listToArray(), label="delete() after last() (Rima)");
	writeOutput("<hr />");
	
	// first
	writeOutput("<h2>first()</h2>");
	maoriNumbers.first();
	writeDump(var={data=maoriNumbers.data, id=maoriNumbers.id}, label="first(), & public variables");
	writeOutput("<hr />");

	// last
	writeOutput("<h2>last()</h2>");
	maoriNumbers.last();
	writeDump(var={data=maoriNumbers.data, id=maoriNumbers.id}, label="last()");
	writeOutput("<hr />");
	
	// next
	writeOutput("<h2>next()</h2>");
	maoriNumbers.first();
	maoriNumbers.next();
	writeDump(var={data=maoriNumbers.data, id=maoriNumbers.id}, label="next() (after first())");
	writeOutput("<hr />");
	
	// previous
	writeOutput("<h2>previous()</h2>");
	maoriNumbers.previous();
	writeDump(var={data=maoriNumbers.data, id=maoriNumbers.id}, label="previous() (from second element)");
	writeOutput("<hr />");
	
	// isStartOfList
	writeOutput("<h2>isStartOfList()</h2>");
	maoriNumbers.first();
	writeDump(var={data=maoriNumbers.data, id=maoriNumbers.id}, label="first()");
	writeDump(var={isStartOfList=maoriNumbers.isStartOfList()}, label="isStartOfList() @ first()");
	maoriNumbers.next();
	writeDump(var={data=maoriNumbers.data, id=maoriNumbers.id}, label="next()");
	writeDump(var={isStartOfList=maoriNumbers.isStartOfList()}, label="isStartOfList() after calling next()");
	writeOutput("<hr />");
	
	
	// isEndOfList
	writeOutput("<h2>isEndOfList()</h2>");
	maoriNumbers.first();
	writeDump(var={data=maoriNumbers.data, id=maoriNumbers.id}, label="first()");
	writeDump(var={isStartOfList=maoriNumbers.isEndOfList()}, label="isEndOfList() @ first()");
	maoriNumbers.last();
	writeDump(var={data=maoriNumbers.data, id=maoriNumbers.id}, label="last()");
	writeDump(var={isStartOfList=maoriNumbers.isEndOfList()}, label="isEndOfList() after calling last()");
	writeOutput("<hr />");
	
	// looping from start to finish
	writeOutput("<h2>afterEnd()</h2>");
	maoriNumbers.first();
	do{
		writeDump(var={data=maoriNumbers.data, id=maoriNumbers.id, afterEnd=maoriNumbers.afterEnd()});
	} while (!maoriNumbers.next().afterEnd());
	
	

</cfscript>