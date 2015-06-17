<cfscript>
	function swap(st1, st2){
		var stTemp = arguments.st2;

		arguments.st1.boy4 = "Dave";
		arguments.st2.girl4 = "Debbie";

		//writeDump(var=arguments.st1, label="st1: Boys before");
		//writeDump(var=arguments.st2, label="st2: Girls before");

		arguments.st1 = arguments.st2;
		arguments.st2 = stTemp;

		arguments.st1.boy5 = "Ed";
		arguments.st2.girl5 = "Ellen";

		//writeDump(var=arguments.st1, label="st1 after");
		//writeDump(var=arguments.st2, label="st2 after");
	}

	stBoys = {boy1="Adam", boy2="Barry", boy3="Charlie"};
	stGirls = {girl1="Angela", girl2="Belinda", girl3="Carrie"};

	writeDump(var=stBoys, label="stBoys before");
	writeDump(var=stGirls, label="stGirls before");


	swap(stBoys, stGirls);

	writeDump(var=stBoys, label="stBoys after");
	writeDump(var=stGirls, label="stGirls after");
</cfscript>