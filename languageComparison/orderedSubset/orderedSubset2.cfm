<cfscript>
// orderedSubset.cfm
numbers = {
	one = {
		maori	= "tahi",
		roman	= "i"
	},
	two = {
		maori	= "rua",
		roman	= "ii"
	},
	three = {
		maori	= "toru",
		roman	= "iii"
	},
	four = {
		maori	= "wha",
		roman	= "iv"
	}
}
digits = ["four", "two"]

answer = digits.map(function(v,i){
	return numbers[v].append({key=v})
})

dump(answer)
</cfscript>
