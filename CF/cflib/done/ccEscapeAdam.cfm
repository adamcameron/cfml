<cfscript>
function ccEscape(ccnum){
	var leave = 4;
	if (arrayLen(arguments) GT 1){
		leave = arguments[2];
	}
	
    if	(len(ccnum) lte leave){
    	return repeatString("*", leave);	
    }
    return repeatString("*", len(ccnum)-leave) & right(ccnum, leave);
}
</cfscript>

<cfset creditcard="4343010125259797">
<cfoutput>#ccEscape(creditcard)#</cfoutput>

<cfoutput>
<p>#hideChars('1aaa1111bbb')#</p>
<p>#hideChars(123123123)#</p>
<p>#hideChars(22)#</p>
</cfoutput>