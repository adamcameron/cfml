<cfscript>
numbers = queryNew("id,en,mi", "int,varchar,varchar",[
	[1,"one","tahi"],
	[2,"two","rua"],
	[3,"three","toru"],
	[4,"four","wha"]
])

for(number in numbers){
	number.en = number.en.toUpperCase()
}
dump(numbers)
echo("<br><br>")

numbers = [
	{id=1,en="one",mi="tahi"},
	{id=2,en="two",mi="rua"},
	{id=3,en="three",mi="toru"},
	{id=4,en="four",mi="wha"}
]

for (number in numbers){
	number.en = number.en.toUpperCase()
}
dump(numbers)
</cfscript>