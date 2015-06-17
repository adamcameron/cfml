<cfscript>
answers = {
	angela	= "purple",
	bob		= "orange",
	carol	= "green",
	dave	= "purple",
	emma	= "orange",
	frank	= "purple"	
}

answerTally = answers.reduce(function(previousValue,key,value,struct){
	if (!structKeyExists(previousValue, value)){
		previousValue[value] = {
			tally	= 0,
			people	= []
		}
	}
	previousValue[value].tally++
	arrayAppend(previousValue[value].people, key)
	return previousValue
}, {})
dump(answerTally)
</cfscript>