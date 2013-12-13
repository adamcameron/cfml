<cfscript>
// base on same-named function from Underscore.cfc (https://github.com/russplaysguitar/UnderscoreCF/)
public function function memoize(func, hasher) {
	var memo = {};
	if (!structKeyExists(arguments, 'hasher')) {
		arguments.hasher = function(hashArgs) {
			return hashArgs[1];
		};
	}
	return function() {
		var key = hasher(arguments);
		if (!structKeyExists(memo, key)) {
			memo[key] = func(argumentCollection = arguments);
		}
		return memo[key];
	};
}


heavyLifting = memoize(
	function (required string label) {
		sleep(1000);
		return "Executed for #label# at: #ts()#<br>";
	}
);

// not cached
writeOutput("<h3>Not Cached</h3>");
writeOutput("Called at: #ts()#<br>");
writeOutput(heavyLifting(label="first"));
sleep(1000);
writeOutput("Called at: #ts()#<br>");
writeOutput(heavyLifting(label="second"));
sleep(1000);

// cached
writeOutput("<h3>Cached</h3>");
writeOutput("Called at: #ts()#<br>");
writeOutput(heavyLifting(label="first"));
sleep(1000);
writeOutput("Called at: #ts()#<br>");
writeOutput(heavyLifting(label="second"));
sleep(1000);

function ts(){
	return timeFormat(now(), "HH:MM:SS");
}
</cfscript>