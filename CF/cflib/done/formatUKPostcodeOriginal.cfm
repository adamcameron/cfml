<cfscript>
function formatUKPostcode(str){
	var strPostcode = ucase(trim(replacenocase(str,' ','','all')));
	return left(strPostcode,len(strPostcode)-3) & ' ' & right(strPostcode,3);
}
	
</cfscript>
<cfoutput>
OX4 1XP: #formatUKPostcode("OX41XP")#<br>
OX11 0AL: #formatUKPostcode("OX110AL")#<br>
O11 0AS: #formatUKPostcode("O110AS")#<br>
RG1 AP: #formatUKPostcode("RG1AP")#<br>
WC1V 6RL: #formatUKPostcode("WC1V6RL")#<br>
W1 1AA: #formatUKPostcode("W11AA")#<br>
</cfoutput>