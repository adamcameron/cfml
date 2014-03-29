<cfscript>
answers = {
	angela	= "purple",
	bob		= "orange",
	carol	= "green",
	dave	= "purple",
	emma	= "orange",
	frank	= "purple"	
}

individualsAnswerUniqueness = map(answers, function(key,value,struct){
	return {colour=value,factor=arrayLen(structFindValue(struct, value, "all"))}
})
dump(individualsAnswerUniqueness)
</cfscript>