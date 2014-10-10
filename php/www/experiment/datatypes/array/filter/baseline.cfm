<cfscript>
green = ["whero","karaka","kowhai","kakariki","kikorangi","poropango","papura"].filter(function(colour){
	return colour == "kakariki"
})

echo(serializeJson(green))
</cfscript>