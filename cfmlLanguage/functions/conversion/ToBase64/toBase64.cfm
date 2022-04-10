<cfset i = javaCast("int", 0)>

<cfoutput>
	formatBase64(9925): [#formatBase64(9925)#]<br />
	formatBase16(65536): [#formatBase16(65536)#]<br />
	formatBase64(65536): [#formatBase64(65536)#]<br />
</cfoutput>

<cfscript>
function formatBase64(n){
	var sResult = "";
	var lNumerals = "123456789?@ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0";
	var iNumber = arguments.n;
	var iRemainder = 0;
	
	while (iNumber ge 64){
		iRemainder = iNumber mod 64;
		sResult = mid(lNumerals, iif(iRemainder, iRemainder, 64), 1) & sResult;
		iNumber = iNumber \ 64; 
	}		
	sResult =  mid(lNumerals, iif(iNumber, iNumber, 64), 1) & sResult;
	return sResult;
}

	function formatBase16(n){
		var sResult = "";
		var lNumerals = "123456789ABCDEF0";
		var iNumber = arguments.n;
		var iRemainder = 0;
		
		while (iNumber ge 16){
			iRemainder = iNumber mod 16;
			sResult = mid(lNumerals, iif(iRemainder, iRemainder, 16), 1) & sResult;
			iNumber = iNumber \ 16; 
		}
		sResult = mid(lNumerals, iif(iNumber, iNumber, 16), 1) & sResult;
		return sResult;
	}

</cfscript>