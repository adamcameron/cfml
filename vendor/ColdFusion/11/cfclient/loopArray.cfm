<cfclient>
	<cfscript>
		letters = ["a","b","c","d","e"];

		newArray = arrayReduce(letters,function(i, v){
			return v;
		});

		console.dir(letters);
	</cfscript>
</cfclient>
<!--- 
<cfscript>
	letters = listToArray("a,b,c,d,e");
	arraySort(letters,function(e1,e2){
		return compare(e1,e2) * -1;
	});
	writeDump(letters);
</cfscript> --->