<cfscript>
//cf4_5.cfm
originalArray		= arrayNew(1);
originalArray[1]	= "tahi";
originalArray[2]	= "rua";
originalArray[3]	= "toru";
originalArray[4]	= "wha";
</cfscript>

<cf_arraymap array="#originalArray#" callbackArgs="callbackArgs" returnVariable="mappedArray">
	<cf_toupper value="#callbackArgs.value#">
</cf_arraymap>
<cfdump var="#mappedArray#">

<cfdump var="#variables#">