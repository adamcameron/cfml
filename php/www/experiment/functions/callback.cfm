<cfscript>
langs = {
	all = function(){
		return [
			{lang="English"}, {lang="Maori"}
		]
	}
}

rules = {
	type1="rule 1",
	type2="rule 2",
	type3="rule 3",
	type4="rule 4"
}



function constructRules(rules, langs) {
var langRules = {}
	rules.each(function(fieldType, rule){
		langs.all().each(function(lang) {
			langRules[fieldType & '[' & lang.lang & ']'] = rule
		})
	})

	return langRules
}


result = constructRules(rules, langs)

dump(result)
echo("<hr>")


function constructRulesWithCallback(rules, langs, task) {
var langRules = {}
	rules.each(function(fieldType, rule){
		langs.all().each(function(lang) {
			task()
		})
	})

	return langRules
}


result = constructRules(rules, langs, function(){
	langRules[fieldType & '[' & lang.lang & ']'] = rule}
)

dump(result)


</cfscript>