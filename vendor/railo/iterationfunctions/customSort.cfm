<cfscript>
function customRankings(required array options, required string field, boolean throwOnNoMatch=false){
	return function(v1,v2){
		var v1Place = options.findNoCase(v1[field])
		var v2Place = options.findNoCase(v2[field])

		if (v1Place && v2Place){
			return sgn(v1Place - v2Place)
		}
		if (throwOnNoMatch){
			throw(type="IllegalValueException", message="Incorrect value in sort field", detail="Sort field must contain only #options.toString()#")
		}

		if (v1Place){
			return -1
		}
		
		if (v2Place){
			return 1
		}

		if (isNumeric(v1[field]) && isNumeric(v2[field])) {
			return sgn(v1[field] - v2[field])
		}

		return compareNoCase(v1[field], v2[field])
	}
}

raceResults = [
	{lane=1, name="Angus", place="silver"},
	{lane=2, name="Barbara", place="gold"},
	{lane=3, name="Colin", place="5th"},
	{lane=4, name="Ethel", place="4th"},
	{lane=5, name="Faisal", place="bronze"}
]
medalSorter = customRankings(["gold","silver","bronze"], "place")
dump(raceResults.sort(medalSorter))

rugbyRankings = [
	{country="Australia", ranking="3rd"},
	{country="England", ranking="4th"},
	{country="New Zealand", ranking="1st"},
	{country="South Africa", ranking="2nd"}
]
ordinalSorter = customRankings(["1st","2nd","3rd","4th"], "ranking")
echo("<br><br>")
dump(rugbyRankings.sort(ordinalSorter))


</cfscript>