// TranslationService.cfc
component {

	public TranslationService function init(){
		variables.translations = {
			"one"	= "tahi",
			"two"	= "rua",
			"three"	= "toru",
			"four"	= "wha",
			"five"	= "rima",
			"six"	= "ono",
			"seven"	= "whitu",
			"eight"	= "ware",
			"nine"	= "iwa",
			"ten"	= "tekau"
		};
		return this;
	}

	function translate(required string string){
		if (structKeyExists(variables.translations, string)){
			return variables.translations[string];
		};
		return "__INVALID_KEY:#string#__";
	}

}