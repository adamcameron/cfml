<cfscript>
arrays.all = ["Tahi","Rua","Toru","Wha","Rima","Ono","Whitu","Waru","Iwa","Tekau"];

boolean function oddsOnly(element){
	param name="i" default=1;
	return i++ MOD 2;
}


arrays.odds = arrayFilter(
	arrays.all,
	oddsOnly
);
writeDump(arrays);
</cfscript>