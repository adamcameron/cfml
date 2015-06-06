<cfscript>
	function hideChars(myAct) {
		var shownChars = 4;
		var hideChar = '*';
		var numOfChars = len(myAct);
		var placeHolder = '';
		
		for (i=1; i lte numOfChars; i++) {
			placeHolder = placeHolder & replace(mid(myAct,i,1),	mid(myAct,i,1),hideChar);	
		}
			
		if (numOfChars gt shownChars) { 
			myAct = placeHolder & right(myAct,4);
			
		} else {
			myAct = placeHolder;
		}
		return myAct;
	}
</cfscript>
<cfoutput>
<p>#hideChars('1aaa1111bbb')#</p>
<p>#hideChars(123123123)#</p>
<p>#hideChars(22)#</p>
</cfoutput>