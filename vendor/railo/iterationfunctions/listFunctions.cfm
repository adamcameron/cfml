<cfscript>
pageencoding "UTF-8"
week = ["Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu"]
week = week.toList()

each = listEach(week,function(v,i,l){
	echo("#i#:#v# (#l#)<br>")
})
dump([each?:"NULL"])
echo("<hr>")
try {
	sorted = listSort(week, function(v1,v2){
		return compare(v1,v2)
	})
	dump([sorted])
}
catch (any e){
	echo("#e.type# #e.message#<br>")
}
echo("<hr>")

filtered = listFilter(week, function(v){
	return v.length() > 5
})
dump([filtered])
echo("<hr>")

try {
	some = listSome(week, function(v){
		return v.length() > 3
	})
	dump([some])
}
catch (any e){
	echo("#e.type# #e.message#<br>")
}
echo("<hr>")


/*




any = week.listAny(function(v){
	return v.length() == 3
})
dump([week,any])

map = week.listMap(function(v){
	return v.ucase()
})
dump([week,any])

reduce = week.listReduce(function(){
	dump(arguments)
})
dump([week,any])
*/

</cfscript>