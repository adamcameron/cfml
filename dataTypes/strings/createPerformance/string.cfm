<cfscript>
// string.cfm
startTime = getTickCount();
s = "";
for (i=1; i <= stringLength; i++){
	s &= "X";
}
endTime = getTickCount();
</cfscript>