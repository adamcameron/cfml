<cfscript>
//cf4_5.cfm
originalArray		= arrayNew(1);
originalArray[1]	= "tahi";
originalArray[2]	= "rua";
originalArray[3]	= "toru";
originalArray[4]	= "wha";

function toUpper(string){
	return ucase(string);
}
</cfscript>
<cf_arraymap array="#originalArray#" callback="#toUpper#" returnVariable="mappedArray">
<cfdump var="#mappedArray#">