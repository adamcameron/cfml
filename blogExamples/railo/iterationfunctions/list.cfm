<cfscript>
rainbow	= "whero,karaka,kowhai,kakariki,kikorangi,tawatawa,mawhero"

"first,second".each(function(){
	dump(arguments)
})
echo("<br><br><br>")

rainbow.each(function(element,index,list){
	echo("#index#/#listLen(list)#: #element#<br>")
})
echo("<br><br><br>")

result = rainbow.filter(function(element,index){
	return !element.startsWith("k")
})
echo("The colours not starting with k are: #result#<br>")
echo("<br><br><br>")

/*
result = rainbow.sort(function(e1,e2){
	return sgn(e1.len() - e2.len())
})
echo("sorted colours: #result#<br>")
*/

longest = 0
result = rainbow.every(function(element,index){
	echo("Checking: #element#<br>")
	var length = element.len()
	var longer	= length >= longest
	longest = max(longest,length)
	return longer
})
echo("Every colour is at least as long as the previous: #result#<br>")
echo("<br><br><br>")

result = rainbow.some(function(element,index){
	echo("Checking: #element#<br>")
	var vowels = element.reReplaceNoCase("[^aeiou]", "", "all")
	var vowelsLen = vowels.len()
	echo("#vowels#: #vowelsLen#; #vowelsLen >= 4#<br><br>")
	return vowelsLen >= 4
})
echo("Some maori colours have at least four vowels in them: #result#<br>")
echo("<br><br><br>")

newRainbow = listChangeDelims(rainbow, "|")
backwards = newRainbow.map(function(element,index){
	dump(arguments)
	return element.reverse()
}, "|")
dump(backwards)
echo("<br><br><br>")

"first,second".reduce(function(){
	dump(arguments)
	return ""
},"")

tally = rainbow.reduce(function(prev,current){
	return prev + current.len()
}, 0)
dump(tally)
</cfscript>