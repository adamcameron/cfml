<cfscript>
numbers = ["one","two","three","four"]
numbers.each(function(value,index){
	if (value=="one") {
		numbers.append("five")
	}
	echo("Index: #index#; value: #value#<br>")
});
dump(var=numbers)
</cfscript>