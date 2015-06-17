<cfscript>
	param name="URL.iterations" type="integer";

	numbers = new Numbers();

	timeIterations(URl.iterations, evaluateDynamicMethod);
	timeIterations(URl.iterations, referenceDynamicMethod);
	timeIterations(URl.iterations, cfinvokeDynamicMethod);

	function evaluateDynamicMethod(){
		var languageToUse	= "";
		var theNumbers		= false;

		languageToUse = "Maori";
		theNumbers = evaluate("numbers.in#languageToUse#(number=1)");

		languageToUse = "English";
		theNumbers = evaluate("numbers.in#languageToUse#(number=2)");
	}

	function referenceDynamicMethod(){
		var languageToUse	= "";
		var theNumbers		= false;

		languageToUse = "Maori";
		numbers.__staticallyNamedMethod = numbers["in#languageToUse#"];
		numbers.__staticallyNamedMethod(number=1);

		languageToUse = "English";
		numbers.__staticallyNamedMethod = numbers["in#languageToUse#"];
		numbers.__staticallyNamedMethod(number=2);

	}
</cfscript>

<cffunction name="cfinvokeDynamicMethod">
	<cfset var languageToUse	= "">
	<cfset var theNumbers		= false>

	<cfset languageToUse = "Maori">
	<cfinvoke component="#numbers#" method="in#languageToUse#" number="1">

	<cfset languageToUse = "English">
	<cfinvoke component="#numbers#" method="in#languageToUse#" number="2">

</cffunction>