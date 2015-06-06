<cfscript>
function arrayDiffOld(smallerArray,biggerArray) {
    var i = "";
    var result = arrayNew(1);
    var s = arrayToList(arguments.smallerArray);
    for (i=1;i lte arrayLen(arguments.biggerArray); i=i+1) if (listFind(s, arguments.biggerArray[i]) is 0) arrayAppend(result, arguments.biggerArray[i]);
    return result;
}

	array function arrayDiff(a1, a2){
		a2.removeAll(a1);
		return a2;
	}
	
	a1 = ["toru"];
	a2 = ["tahi", "rua", "toru", "toru", "wha"];
	a3 = arrayDiff(a1, a2);
	a4 = arrayDiffOld(a1, a2);
	//writeDump(variables);

	aSmaller = arrayNew(1);
	aSmaller[1] = 'a';
	aSmaller[2] = 'c';
	aBigger = arrayNew(1); 
	aBigger[1] = 'a';
	aBigger[2] = 'c';
	aBigger[3] = 'b';
	aBigger[4] = 'd';	
	a5 = arrayDiff(aSmaller, aBigger);
	a6 = arrayDiffOld(aSmaller, aBigger);
	//writeDump([a5,a6]);
	
	q = queryNew(""); queryAddColumn(q, "id", [1,2,3,4]);
	st = {foo="bar"};
	a = ["tahi", "rua", "toru", "wha"];
	a7 = [q, st, a];
	a8 = [q];
	a9 = [st];
	a10 = [a];
	writeDump(a7);
	writeDump(arrayDiff(a8, a7));
	writeDump(arrayDiff(a9, a7));
	writeDump(arrayDiff(a10, a7));
	
</cfscript>