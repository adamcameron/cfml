<cfscript>
//arraySplit.cfm
function arraySplit(required array array, required numeric at){
	var length = array.len();
	var split = {
		left	= [],
		right	= []
	};
	for (var i=1; i <= at && i <= length; i++){
		arrayAppend(split.left, arrayIsDefined(array, i) ? array[i] : javaCast("null", ""));
	}
	for (i=at+1; i <= length; i++){
		arrayAppend(split.right, arrayIsDefined(array, i) ? array[i] : javaCast("null", ""));
	}

	return split;
}	
</cfscript>