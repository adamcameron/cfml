<cfscript>
public array function arrayCartesianProduct(required array arrays) {
	var result = [];
	var arraysLen = arrayLen(arguments.arrays);
	var size = (arraysLen) ? 1 : 0;
	var array = '';
	var x = 0;
	var i = 0;
	var j = 0;
	var current = [];
	
	for (x=1; x <= arraysLen; x++) {
		size = size * arrayLen(arguments.arrays[x]);
		current[x] = 1;
	}
	for (i=1; i <= size; i++) {
		result[i] = [];
		for (j=1; j <= arraysLen; j++) {
			arrayAppend(result[i], arguments.arrays[j][current[j]]);
		}
		for (j=arraysLen; j > 0; j--) {
			if (arrayLen(arguments.arrays[j]) > current[j])  {
				current[j]++;
				break;
			}
			else {
				current[j] = 1;
			}
		}
	}
	
	return result;
}
</cfscript>

<cfset arrayOfArrays = [[129,128,127],[130,131,132],[135,133,134],[137,138,136],[140,139],[141,142]]>
<cfset res = arrayCartesianProduct(arrayOfArrays)>
<cfoutput>#arraylen(res)#</cfoutput>
<cfdump var="#res#">