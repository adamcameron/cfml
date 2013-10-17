<cffunction name="getExcelPercentile" returntype="numeric" output="false" hint="Equivalent to the MS Excel percentile() / percentile.exc() functions.">
	<cfargument name="values" type="array" required="true" hint="Array of numeric values to return percentile for.">
	<cfargument name="percentile" type="numeric" required="true" hint="Percentile to calculate (0-100).">
	<cfargument name="inclusive" type="boolean" required="false" default="true" hint="Whether to perform an inclusive (percentile()) or exclusive (percentile.exc()) calculation. Will throw a PercentileOutOfBounds exception if using exclusive percentile and 'percentile' falls outwith 1/(n+1) and n/(n+1), where 'n' is the length of the values array.">

	<cfscript>
		var rangeArray = arguments.values;
		var rangePoint = 0;
		var integerPart = 0;
		var decimalPart = 0;
		var returnValue = 0;
		var pctile = arguments.percentile * .01;
		var numberOfValues = arrayLen(arguments.values);

		arraySort(rangeArray, "numeric");

		if (!inclusive) {
			rangePoint = (numberOfValues - 1) * pctile + 1;
		}
		else {
			rangePoint = (numberOfValues + 1) * pctile;
		}

		if (rangePoint > numberOfValues || rangePoint < 1){
			throw(type="PercentileOutOfBounds", message="Percentile out of bounds" detail="PERCENTILE falls outwith 1/(n+1) and n/(n+1), where 'n' is the length of the VALUES array.");
		}

		if (rangePoint > numberOfValues) {
			rangePoint = numberOfValues;
		}
		else if (rangePoint < 1) {
			rangePoint = 1;
		}

		// if rangePoint is an integer, return that array element
		if (round(rangePoint) == rangePoint) {
			returnValue = rangeArray[rangePoint] ;
		}
		else {
			integerPart = int(rangePoint);
			decimalPart = rangePoint - integerPart;
			returnValue = rangeArray[integerPart] + decimalPart * (rangeArray[integerPart + 1] - rangeArray[integerPart]);
		}
		return returnValue;
	</cfscript>
</cffunction>

<cfscript>
numbers = [];
for (i=1; i <= randRange(1,20); i++){
	arrayAppend(numbers, randRange(1,1000));
}
percentile = randRange(1,100);

result = getExcelPercentile(numbers, percentile);
writeDump(variables);
</cfscript>