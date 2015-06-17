<cfscript>
URL.firstVariable = 17;
someOtherVariable = firstVariable;

URL.secondVariable = 19;
secondVariable = 23;

URL.thirdVariable = 29;
thirdVariable++;


URL.fourthVariable = 31;
fourthVariable = fourthVariable + 1;
writeDump(var={
	"URL.fourthVariable"		= URL.fourthVariable,
	"variables.fourthVariable"	= variables.fourthVariable
});


</cfscript>