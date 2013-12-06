<cfscript>
	/**
	@hint creates a function which will wrap passed-in text with the specified tag. Any addition arguments passed to this function will be treated as attribute/value pairs of the tag
	@tag The tag to wrap the function's text in
	*/
	string function renderWith(required string tag){
		var theTag		= "";
		var attributes	= "";
		var attribute	= "";
		
		if (structKeyExists(arguments, "tag")){
			theTag = arguments.tag;
			structDelete(arguments, "tag");
		}else{
			theTag = arguments[1];
			arrayDeleteAt(arguments, 1);
		}

		// the rest are attributes of said tag
		for (attribute in arguments){
			attributes &= " #lcase(attribute)#=""#arguments[attribute]#""";
		}

		/**
		@text The text to wrap with the specified tag
		*/
		return function(required string text){
			// stick 'em all together and return
			return "<#theTag##attributes#>#text#</#theTag#>";
		};
	}
	
	asGreenHeading	= renderWith(tag="h1", style="color:green");
	asPara			= renderWith("p");

	asTable			= renderWith(tag="table", border="1", cellspacing="2", cellpadding="2");
	asTr			= renderWith("tr");
	asTd			= renderWith("td");
</cfscript>

<cfoutput>
	#asGreenHeading("Hello World")#
	#asPara("This is a fairly contrived example of CF closures")#
	#asTable(
		asTr(
			 asTd("Tahi") & asTd("Rua") & asTd("Toru") & asTd("Wha")
		)
	)#
</cfoutput>