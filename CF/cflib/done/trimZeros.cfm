<cfscript>
function trimZeros(num){	
	if(val(num) == 0){
		return "0";
	} else if (num < 1) {
		return "." & listLast(num + 0,".");	
	} else {
		return num + 0;		
	} 	
}	


</cfscript>

<cfoutput>
#trimZeros("0")# = 0<br />
#trimZeros("0.01")# = .01<br />
#trimZeros("0.50")# = .5<br />
#trimZeros("1.0")# = 1<br />
#trimZeros("1.50")# = 1.5<br />
#trimZeros("1.51")# = 1.51<br />
	
</cfoutput>