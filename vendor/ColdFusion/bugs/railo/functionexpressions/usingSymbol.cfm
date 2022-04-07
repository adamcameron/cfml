<!--- usingSymbol.cfm --->
<cfset tosser = function(){
	var coin = randRange(1,2);
	if (coin > 1){
		return "heads";
	}else{
		return "tails";
	}
}>

<cfoutput>
#tosser()#<br>
#tosser()#<br>
#tosser()#<br>
#tosser()#<br>
</cfoutput>