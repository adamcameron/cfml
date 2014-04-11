<cfscript>
	haystack = "find in this string"
	needle	= "i"
	result = extendedFind(haystack, needle,{
		startIndex				: 1,
		caseSensitive			: true,
		findAll					: false
		regex					: false,
		subexpressions			: false,
		list					: false,
		listElement				: false,
		delimiter				: ",",
		includeEmptyElements	: true
	})



	public any function extendedFind(required string haystack, required string needle, struct options){
		param name="options.startIndex"				type="numeric"	default=1;			// either character in string, or element in list
		param name="options.caseSensitive"			type="boolean"	default=true;		// self-evident
		param name="options.findAll"				type="boolean"	default=false;		// if true, returns array of matches, not single match
		param name="options.regex"					type="boolean"	default=false;		// it true, uses "re" variant of function
		param name="options.subexpressions"			type="boolean"	default=false;		// only relevant if regex=true. If true, returns match as array
		param name="options.list"					type="boolean"	default=false;		// uses list-oriented variation
		param name="options.listElement"			type="boolean"	default=false;		// true = listContains(), false = listFind()
		param name="options.delimiter"				type="string"	default=",";		// for list variations
		param name="options.includeEmptyElements"	type="boolean"	default=true;		// for list variations	
	}

</cfscript>