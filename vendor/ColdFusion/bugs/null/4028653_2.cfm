<cfscript>
function returnsSomething(option){
	if (option == "null") {
		return;
	}
	return option;
}

options = [true, false, "null"];
options.each(function(option){
	CLI.writeln("***** TESTING OPTION: #option# *****");
	CLI.writeln("");
	safeRun("using if", function(){
		if (returnsSomething(option)){
			var result = "truthy";
		}else{
			var result = "falsey";
		}
		CLI.writeln("Result: #result#");
	});
	safeRun("using ternary", function(){
		var result = returnsSomething(option) ? "truthy" : "falsey";
		CLI.writeln("Result: #result#");
	});
	safeRun("using elvis", function(){
		var result = returnsSomething(option) ?: "falsey";
		CLI.writeln("Result: #result#");
	});
});

function safeRun(message="", task){
	CLI.writeln(message);
	try {
		task();
		CLI.writeln("Ran OK");
	}catch (any e){
		CLI.writeln("Type: #e.type#");
		CLI.writeln("Message: #e.message#");
		CLI.writeln("Detail: #e.detail#");
	}finally {
		hr();
	}
}

function hr(){
	CLI.writeln(repeatString("=", 80));
}
</cfscript>