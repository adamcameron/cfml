<cfscript>
condition = "b";
case1 = "a";
case2 = "b";

switch(condition){
	case case1:
		writeOutput("It was #case1#");
	break;
	case case2:
		writeOutput("Or it was #case2#");
	break;
	default:
		writeOutput("It was the default");
	break;
}
</cfscript>