<cfscript>
// array_filter.cfm

array = [
	{
		1 = "a",
		2 = "b",
		3 = "c",
		4 = "d"
	},
	{
		5 = "e",
		6 = "f",
		7 = "g"
	},
	{
		8 = "h",
		9 = "i"
	},
	{
		10 = "j"
	}
]


function findChunks(array, key){
	return array.filter(function(struct){
		return struct.keyExists(key)
	})
}

chunk = findChunks(array, 7)

dump(var=chunk)
</cfscript>