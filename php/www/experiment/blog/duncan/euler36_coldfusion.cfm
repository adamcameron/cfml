<cfscript>
// euler36_coldfusion.cfm

start = getTickCount();

function createPalindromeSequence(max=-1){
	var n				= 0;
	var reserveStack	= [];
	var shortPalindrome	= 0;

	return function(){
		n = javacast("string", n);
		shortPalindrome = n & n.reverse().mid(2, n.len());
		if (reserveStack.len() && shortPalindrome > reserveStack[1]){
			var nextOne = reserveStack[1];
			reserveStack.deleteAt(1);
			return nextOne;
		}
		if (max != -1 && shortPalindrome > max) return;
		n++;
		n = javacast("string", n);
		reserveStack.append(n & n.reverse());
		return shortPalindrome;
	};
}

function isPalindrome(string s){
	return s == s.reverse();
}

palindromSequence = createPalindromeSequence(1000000);
decPalindromes = [];
while(true) {
	next = palindromSequence();
	if (isNull(next)) break;
	decPalindromes.append(next);
}

sum = decPalindromes.reduce(function(reduction,current){
	asBinary = formatBaseN(current, 2);
	if (isPalindrome(asBinary)){	
		writeOutput("#current# #asBinary#<br>");
		reduction += current;
	}
	return reduction;
},0);
writeOutput("#sum#<hr>");

end = getTickCount();

writeOutput("Execution time: #end-start#ms");
</cfscript>