<cfscript>
string function passThrough(required struct attr)   output="false"  {
	local.result = "";

	for(local.myKey in arguments.attr)    {
		if (local.myKey.left(5) == "data-" || local.myKey.left(2) == "on" || local.myKey.left(3) == "ng-")  {

			local.result &= ' #local.myKey.lcase()#="#encodeForHTMLAttribute(arguments.attr[local.myKey])#"';
		} // end if
	}   // end for

	return local.result;
}
</cfscript>