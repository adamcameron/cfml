<cfscript>
numbers = ["tahi","rua","toru","wha"]

each(["single"],function(value,index,array){
	dump(arguments)
})
echo("<hr>")

arrayEach(numbers, function(v){
	echo (v & "<br>")
})
echo("<hr>")

numbers.each(function(v){
	echo(v.toUpperCase() & "<br>")
})
</cfscript>