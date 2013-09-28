<cfscript>
arrays.all = ["Tahi","Rua","Toru","Wha","Rima","Ono","Whitu","Waru","Iwa","Tekau"];

arrays.odds = arrayFilter(
	arrays.all,
	function(element){
		param name="i" default=1;
		return i++ MOD 2;
	}
);
writeDump(arrays);
</cfscript>