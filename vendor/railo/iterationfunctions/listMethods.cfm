<cfscript>
pageencoding "UTF-8"
week = ["Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu"]
week = week.toList()

/*
each = week.listeach(function(){
	dump(arguments)
})
dump([week,each])

sorted = week.listSort(function(v1,v2){
	return compare(v1,v2)
})
dump([week,sorted])

filtered = week.listFilter(function(v){
	return v.length() == 3
})
dump([week,filtered])

some = week.listSome(function(v){
	return v.length() == 3
})
dump([week,some])

any = week.listAny(function(v){
	return v.length() == 3
})
dump([week,any])

map = week.listMap(function(v){
	return v.ucase()
})
dump([week,any])

*/

reduce = week.listReduce(function(){
	dump(arguments)
})
dump([week,any])
</cfscript>