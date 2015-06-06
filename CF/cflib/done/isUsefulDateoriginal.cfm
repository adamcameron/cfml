<cfscript>
function isUsefulDate(date){
	if(isDate(date)){
		if(abs(dateDiff("yyyy",date,now())) LTE 100)
			return true;
		else
			return false;
		}
	else
		return false;
}
</cfscript>

<cfoutput>
#isUsefulDate("blah")#
#isUsefulDate("9/14/201")#
#isUsefulDate("9/14/2010")#
#isUsefulDate("9/14/20100")#
	
</cfoutput>