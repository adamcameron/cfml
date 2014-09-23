langs = {
	all : function(){
		return [
			{lang:"English"}, {lang:"Maori"}
		]
	}
}

rules = [
	{type1:"rule 1"},
	{type2:"rule 2"},
	{type3:"rule 3"},
	{type4:"rule 4"}
]



function constructRules(rules, langs) {
	var langRules = {}
	rules.forEach(function(fieldType, rule){
		langs.all().forEach(function(lang) {
			langRules[fieldType + '[' + lang.lang + ']'] = rule
		})
	})

	return langRules
}


result = constructRules(rules, langs)

console.dir(result)


function constructRulesWithCallback(rules, langs, task) {
var langRules = {}
	rules.forEach(function(fieldType, rule){
		langs.all().forEach(function(lang) {
			task()
		})
	})

	return langRules
}


result = constructRules(rules, langs, function(){
	langRules[fieldType + '[' + lang.lang + ']'] = rule}
)

console.dir(result)
