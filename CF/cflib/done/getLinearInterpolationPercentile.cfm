<cfscript>
function getLinearInterpolationPercentile(pctile, range) {
	var rangeArr = listToArray(range);
	var rangePoint = 0;
	
	if (pctile gt 100){
		pctile = 100;
	}
	
	arraySort(RangeArr, "numeric");
	pctile = pctile * .01;
	rangePoint = max(round(arrayLen(rangeArr)*pctile), 1);
	
	if (
		round(arrayLen(rangeArr) * pctile) is arrayLen(rangeArr) * pctile
		or
		round(arrayLen(rangeArr) * pctile) is arrayLen(rangeArr)
	){
		return rangeArr[rangePoint]; 
	}
	else {
		return (rangeArr[rangePoint] + rangeArr[rangePoint + 1]) / 2; 
	}
}


function GetPercentile(pctile, range) {
  var rangeArr = ListToArray(range);
  var rangepoint = "";
  pctile = pctile * .01;
  ArraySort(rangeArr, "numeric");
  rangePoint = Max(Round(ArrayLen(rangeArr)*pctile), 1);
  return rangeArr[rangePoint]; 
}

</cfscript>

<cfoutput>
<cfset TheList = "10,20,30,40,50,60,70,80,90,100">
<cfset percentage = 54>
#GetLinearInterpolationPercentile(percentage, TheList)#<br />
	#GetPercentile(percentage, TheList)#<br />
	
</cfoutput>