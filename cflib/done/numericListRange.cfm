<cfscript>
function NumericListRange(NumbersIn){
	var NumbersOut = ArrayNew(1);
	var start = '';
	var end = '';
	var c = 0;
	/* Convert list to array */
	if (NOT isArray(NumbersIn)){
		NumbersIn = ListToArray(NumbersIn);
	}
	c = arrayLen(NumbersIn);
	/* filter non-numeric values to make safe for ArraySort() */
	for (i=1;i LTE c;i=i+1){
		if (isnumeric(trim(NumbersIn[i]))) {arrayAppend(NumbersOut, val(trim(NumbersIn[i])));}
	}
	NumbersIn = NumbersOut;
	NumbersOut = ArrayNew(1);
	ArraySort(NumbersIn, "numeric");
	c = arrayLen(NumbersIn);
	for (i=1;i LTE c;i=i+1){
		start = NumbersIn[i];
		end = '';
		if(i+2 LT c AND start+1 IS NumbersIn[i+1] AND start+2 IS NumbersIn[i+2]) {
			i=i+2;
			end = NumbersIn[i];
			while(i LT c) {
				i=i+1;
				if(val(end)+1 IS NumbersIn[i]) {end = NumbersIn[i];}
				else {i=i-1; break;}
			}
		}
		if (val(end)) arrayAppend(NumbersOut, start & '-' & end);
		else arrayAppend(NumbersOut, start);
	}
	return NumbersOut;
}
</cfscript>

<CFSET NumberString = "1,3,7,5 ,b, 4">
<cfoutput>#NumberString#</cfoutput>
<cfdump var="#NumericListRange(NumberString)#">
<hr />
<CFSET NumberArray = [1, 2, 6, 10, 15, 19, 'b', 4, 20, 30, 8, 31, 32, 33, 7, 3]>
<cfdump var="#NumberArray#">
<cfdump var="#NumericListRange(NumberArray)#">
<hr />
<CFSET NumberArray = [-5,0,5,-4,4,-3,3,-2,2,-1]>
<cfdump var="#NumberArray#">
<cfdump var="#NumericListRange(NumberArray)#">
<hr />
<CFSET NumberArray = [-5,-4,-3,-2,-1,0,2,3,4,5]>
<cfdump var="#NumberArray#">
<cfdump var="#NumericListRange(NumberArray)#">
