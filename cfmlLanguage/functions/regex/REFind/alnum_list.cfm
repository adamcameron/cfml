<cfscript>
	myList = "1,2,3,4.5,ç,7,8,9,0";

if (reFind("[^[:digit:]\.,]", myList)){
	// sort is alpha
	writeOutput("alpha");
}else{
	// sort is numeric
	writeOutput("numeric");
}
</cfscript>
