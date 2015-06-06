<cfscript>
string function listReFilterNoCase(
	required string targetList,
	required string regexList,
	string mode = "include"
) {
	if ( !listFindNoCase("include,exclude", arguments.mode) ) {
		throw (
			message="mode (if specified), must be either 'include' or 'exclude'"
		);
	}
	
	var target = 0;
	var regex = 0;
	var i = 0;
	
	var targetAry = listToArray(arguments.targetList);
	var regexAry = listToArray(arguments.regexList);
	var filteredAry = [];

	
	if ( arguments.mode is "include" ) {
		for ( target in targetAry ) { // loop targets
			for ( regex in regexAry ) { // loop regexes
				if ( reFindNoCase(regex, target) ) { // match found
					// build up the array
					arrayAppend(filteredAry, target);
					break; // already matched, don't continue
				}
			}
		}
	} else { // mode is "exclude"
		filteredAry = targetAry;
		/* loop backward through target array, so that when we delete an
		** element, it won't shift the array indexes around */
		for ( i=arrayLen(targetAry); i gt 0; i-- ) { // loop targets
			for ( regex in regexAry ) {
				if ( reFindNoCase(regex, targetAry[i]) ) {
					// whittle away at the array
					arrayDeleteAt(filteredAry, i);
					break; // already matched, don't continue
				}
			}
		}
	}
	
	return arrayToList(filteredAry);
	
}	
</cfscript>

<cfscript>
origList = "formFoo1,formFoo2,super,duper,foo,bar,monkey,donkey";
writeOutput("origList: #origList#<br>");

filteredList_includeExample = listReFilterNoCase(
	targetList=origList,
	regexList="^formFoo\d+,uper$",
	mode="include"
);
writeOutput("filteredList_includeExample: #filteredList_includeExample#<br>");

filteredList_excludeExample = listReFilterNoCase(
	targetList=origList,
	regexList="^foo,onkey$,^duper$",
	mode="exclude"
);
writeOutput("filteredList_excludeExample: #filteredList_excludeExample#");

/* 
Yields:
origList: formFoo1,formFoo2,super,duper,foo,bar,monkey,donkey
filteredList_includeExample: formFoo1,formFoo2,super,duper
filteredList_excludeExample: formFoo1,formFoo2,super,bar
*/
</cfscript>