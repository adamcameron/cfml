<cfscript>
function returnsSomething(option){
	if (option == "null") {
		return;
	}
	return option;
}

options = [true, false, "null"];
options.each(function(option){
	CLI.writeln("");
	CLI.writeln("***** TESTING OPTION: #option# *****");
	CLI.writeln("");

	CLI.writeln("using if");
	try {
		if (returnsSomething(option)){
			var result = "truthy";
		}else{
			var result = "falsey";
		}
		CLI.writeln("Result: #result#");
	}catch (any e){
		CLI.writeln("Type: #e.type#");
	}
	hr();

	CLI.writeln("using ternary");
	try {
		var result = returnsSomething(option) ? "truthy" : "falsey";
		CLI.writeln("Result: #result#");
	}catch (any e){
		CLI.writeln("Type: #e.type#");
	}
	hr();

	CLI.writeln("using elvis");
	try {
		result = returnsSomething(option) ?: "falsey";
		CLI.writeln("Result: #result#");
	}catch (any e){
		CLI.writeln("Type: #e.type#");
	}
	hr();
});


function hr(){
	CLI.writeln(repeatString("=", 80));
}
</cfscript>