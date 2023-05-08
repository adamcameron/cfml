<cfscript>
	aBase = arrayNew(1);
	// this is the closests CF gets to 2-D arrays
	aBase[1] = listToArray("1,9,6");
	aBase[2] = listToArray("2,5,4");
	aBase[3] = listToArray("3,1,2");

	stIndex = structNew();
	
	for (i=1; i le arrayLen(aBase); i=i+1){
		stIndex[i] = aBase[i][2];	// we're indexing the second element in the second "dimension"
	}
	
	aIndex = structSort(stIndex, "NUMERIC");
	
	for (i=1; i le arrayLen(aIndex); i=i+1){
		writeOutput("#ArrayToList(aBase[aIndex[i]])#<br />");
	}	
</cfscript>