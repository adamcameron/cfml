<cfscript>
public array function permute(required array r, required array n, required numeric l, numeric i=0, struct s={}, boolean d=false) {
	if (i == (arrayLen(n)-1)) {
		var t = arrayNew(1);
		for (var k=1; k lte l; k++) 	t[k] = n[k];
		if (!d) 						arraySort(t, 'text', 'asc');
		var h = arrayToList(t);
		if (!structKeyExists(s, h)) {
			structInsert(s, h, true, 1);
			arrayAppend(r, t);
		}
	}
	else
		for (var j=i; j lte arrayLen(n)-1; j++) {
			arraySwap(n, i+1, j+1);
			n = permute(r,n,i+1,l,s,d);
			arraySwap(n, i+1, j+1);
		}
	return n;
}

</cfscript>

<cfset values = ['John','Paul','Peter','Jeremiah','Mike','Markus'] />
<cfset number		= 3 />
<cfset duplicates	= true />
<cfset returnValue	= createObject("java", "java.util.ArrayList").Init() />			<!--- ACF coding to pass array by reference --->
<!---<cfset returnValue	= [] />--->															<!--- Railo does it anyway --->
<cfset result = permute(r=returnValue, n=values, l=number, d=duplicates) />
<cfdump var="#returnValue#" label="array of results" />
<cfdump var="#result#">
