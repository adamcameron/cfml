<cfscript>
numbers = queryNew("digit,en,mi", "integer,varchar,varchar", [
	[1,"one","tahi"],
	[2,"two","rua"],
	[3,"three","toru"],
	[4,"four","wha"]
])

echo("<h2>each()</h2>")
echo("<h3>Check arguments</h3>")
numbers.each(function(){
	dump(arguments)
})

echo("<h3>demo</h3>")
numbers.each(function(rowData,currentRow,query){
	echo("#currentRow#/#query.recordCount#: English: #rowData.en#; Maori #rowData.mi#<br>")
})

echo("<h2>every()</h2>")
echo("<h3>demo</h3>")
result = numbers.every(function(rowData,currentRow){
	echo("Checking: #rowData.en#<br>")
	return rowData.en.len() >= rowData.digit
})

echo("All English number names are longer than their value: #result#<br>")

echo("<h2>some()</h2>")
echo("<h3>demo</h3>")
result = numbers.some(function(rowData,currentRow){
	echo("Checking: #rowData.en#<br>")
	return rowData.mi.len() < rowData.digit
})

echo("Some maori number names are shorter than their value: #result#<br>")

echo("<h2>map()</h2>")
echo("<h3>demo: basic</h3>")
backwards = numbers.map(function(rowData,currentRow){
	return {
		en	= rowData.en.reverse(),
		mi	= rowData.mi.reverse()
	}
})
dump(backwards)

echo("<h3>demo: advanced</h3>")
differentCols = numbers.map(function(rowData,currentRow){
	return {
		digit	= rowData.digit,
		english	= rowData.en,
		maori	= rowData.mi,
		both	= "#rowData.mi#_#rowData.en#"
	}
})
dump(differentCols)


echo("<h2>reduce()</h2>")
echo("<h3>Check arguments</h3>")
numbers.reduce(function(){
	dump(arguments)
	return ""
})

echo("<h3>demo</h3>")
numberArray = []
numbers.reduce(function(prev,current){
	prev.append({
		digit	= current.digit,
		mi		= current.mi,
		en		= current.en
	})
	return prev
}, numberArray)
dump(numberArray);
</cfscript>