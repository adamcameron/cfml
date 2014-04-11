<cfscript>
rainbow	= "whero,karaka,kowhai,kakariki,kikorangi,tawatawa,mawhero"

echo("<h2>each()</h2>")
echo("<h3>Check arguments</h3>")
"first,second".each(function(){
	dump(arguments)
})

echo("<h3>demo</h3>")
rainbow.each(function(element,index,list){
	echo("#index#/#listLen(list)#: #element#<br>")
})

echo("<h2>filter()</h2>")
echo("<h3>demo</h3>")
result = rainbow.filter(function(element,index){
	return !element.startsWith("k")
})
echo("The colours not starting with k are: #result#<br>")

/*
echo("<h2>sort()</h2>")
echo("<h3>demo</h3>")
result = rainbow.sort(function(e1,e2){
	return sgn(e1.len() - e2.len())
})
echo("sorted colours: #result#<br>")
*/

echo("<h2>every()</h2>")
echo("<h3>demo</h3>")
longest = 0
result = rainbow.every(function(element,index){
	echo("Checking: #element#<br>")
	var length = element.len()
	var longer	= length >= longest
	longest = max(longest,length)
	return longer
})

echo("Every colour is at least as long as the previous: #result#<br>")

echo("<h2>some()</h2>")
echo("<h3>demo</h3>")
result = rainbow.some(function(element,index){
	echo("Checking: #element#<br>")
	var vowels = element.reReplaceNoCase("[^aeiou]", "", "all")
	var vowelsLen = vowels.len()
	echo("#vowels#: #vowelsLen#; #vowelsLen >= 4#<br><br>")
	return vowelsLen >= 4
})

echo("Some maori colours have at least four vowels in them: #result#<br>")

echo("<h2>map()</h2>")
echo("<h3>demo: basic</h3>")
newRainbow = listChangeDelims(rainbow, "|")
backwards = newRainbow.map(function(element,index){
	return element.reverse()
}, "|")
dump(backwards)

echo("<h2>reduce()</h2>")
echo("<h3>Check arguments</h3>")
"first,second".reduce(function(){
	dump(arguments)
	return ""
},"")

echo("<h3>demo</h3>")
tally = rainbow.reduce(function(prev,current){
	return prev + current.len()
}, 0)
dump(tally)
</cfscript>