<cfscript>
include "common.cfm";

// based on same-named function from Underscore.cfc (https://github.com/russplaysguitar/UnderscoreCF/)
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
message = "Not Cached";
include "testCalls.cfm";

// cached
message = "Cached";
include "testCalls.cfm";
</cfscript>