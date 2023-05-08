<cfscript>
arr1 = [1,2,3];
arr2 = [4,5,6];
total = 0;

arr1.each(function(a1) {
	total = total + a1;
	arr2.each(function(a2) {
		total = total + a2;
	});
});

echo(total);
</cfscript>