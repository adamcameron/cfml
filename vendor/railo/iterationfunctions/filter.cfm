<cfscript>
answers = {
	angela	= "purple",
	bob		= "orange",
	carol	= "green",
	dave	= "purple",
	emma	= "orange",
	frank	= "purple"	
}

uniqueAnswers = structFilter(answers, function(key, value, struct){
	return arrayLen(structFindValue(struct, value, "all")) == 1
})
dump(uniqueAnswers)
echo("<hr>")

sharedAnswers = answers.filter(function(key, value, struct){
	return arrayLen(structFindValue(struct, value, "all")) > 1
})
dump(sharedAnswers)
</cfscript>