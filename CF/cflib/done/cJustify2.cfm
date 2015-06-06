<cfscript>
function cjustify2(string,length) {
	var padChar = " ";
	var padLeftCount = 0;
	var padRightCount = 0;
	if (arrayLen(arguments) GT 2) {
		padChar=left(arguments[3],1);
	}
		
	if (len(string) LT length) {
		padLeftCount = (arguments.length - len(arguments.string)) \ 2; // integer divide by 2 the number of characters for padding
		padRightCount = arguments.length - len(arguments.string) - padLeftCount; // take whatever is left over and put on the right
	}
		
	return repeatString(padChar,padLeftCount) & arguments.string & repeatString(padChar,padRightCount);
}	
</cfscript>

<cfset s = "12345">
<cfset i = 12>
<cfoutput>
<pre>
[#cJustify(s, i)#]
<hr />
[#cJustify2(s, i, ".")#]
</pre>
</cfoutput>