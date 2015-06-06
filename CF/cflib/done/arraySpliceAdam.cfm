<cfscript>
function arraySplice(array, index, howMany) {
	var i = 0;
	
	// If negative, will begin that many elements from the end	
	if (index <= 0){
		index = arrayLen(array) + (index + 1);
	}

	// get rid of however many they specify
	for (i=1; i LE howMany; i++){
		if (index LE arrayLen(array)){
			arrayDeleteAt(array, index);
		}
	}

	for (i=4; i LE arrayLen(arguments); i++){
		if (index GE arrayLen(array)){
			arrayAppend(array, arguments[i]);
			index++;
		}else{
			arrayInsertAt(array, index+(i-4), arguments[i]);
		}
	}

	return array;
}
	
	aOriginal = ["Original 1", "Original 2", "Original 3", "Original 4"];
	writeDump(aOriginal);

	// delete nothing, insert new elements at the third position
	aResult = arraySplice(aOriginal, 3, 0, "Insert 1", "Insert 2");
	writeDump(aResult);
	
	// delete the third element, insert new elements at the third position 
	aResult = arraySplice(aOriginal, 3, 1, "Insert 1", "Insert 2");
	writeDump(aResult);

	// delete the third and fourth elements, insert new elements at the third position 
	aResult = arraySplice(aOriginal, 3, 2, "Insert 1", "Insert 2");
	writeDump(aResult);
	
	// delete the third and fourth elements, insert new elements at the third position 
	aResult = arraySplice(aOriginal, 3, 3, "Insert 1", "Insert 2");
	writeDump(aResult);
	
	aResult = arraySplice(aOriginal, -1, 3, "Insert 1", "Insert 2");
	writeDump(aResult);
	
	aResult = arraySplice(aOriginal, 1, 6, "Insert 1", "Insert 2");
	writeDump(aResult);
	
	aResult = arraySplice(aOriginal, 1, 6);
	writeDump(aResult);
</cfscript>
<script>
	a = ["Original 1", "Original 2", "Original 3", "Original 4"];
	console.log(a);
	a.splice(0, 6);
	console.log(a);
	
	
</script>