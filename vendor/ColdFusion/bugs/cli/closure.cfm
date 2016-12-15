<cfscript>
options = [1];

options.each(function(_){
	safeRun(function(){
		var result = true ?: "falsey";
		writeOutput("Result: #result#");
	});
});

function safeRun(task){
	try {
		task();
	}catch (any e){
		writeOutput("Type: #e.message#");
	}
}
</cfscript>