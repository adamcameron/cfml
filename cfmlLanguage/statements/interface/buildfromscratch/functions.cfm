<cfscript>

public numeric function length(required string s) {
	return len(s);
}

	public string function toMaori(required numeric i){
		return TestInterface <= 4 ? listGetAt("tahi,rua,toru,wha", i) : "dunno";
	}

</cfscript>