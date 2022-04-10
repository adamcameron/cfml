<cfscript>
// make an array to test with
a = [];
for (i=1; i <= 10000; i++){
	a[i] = repeatString(chr(randRange(65, 90)), 100);
}


function format(s) {
    return s;
}
	
function test(arr) {
	for ( i = 1; i < ArrayLen(arr); i++) {
		x = format(arr[i]);
	}
}

iStart = getTickCount();
test(a);
writeOutput("Runtime: #getTickCount()-iStart#");
</cfscript>