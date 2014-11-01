<cfscript>
awards = {
	award_year = ["1999-01", "2010-12"],
	award_title_user = ["2", "tt"],
	award_description_user = ["2", "ddd"]
}


remappedAwards = awards.reduce(function(reduction,key,values){
	var offset = values.len() + 1
	values.each(function(value,index){
		reduction[offset-index][key] = value
	})
	return reduction
},[])

dump([awards, remappedAwards])
</cfscript>