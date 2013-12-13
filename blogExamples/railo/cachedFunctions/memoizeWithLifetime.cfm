<cfscript>
// base on same-named function from Underscore.cfc (https://github.com/russplaysguitar/UnderscoreCF/)
public function function memoize(required function func, numeric cachedWithin=0, function hasher) {
	var memo = {};
	if (!structKeyExists(arguments, "hasher")) {
		arguments.hasher = function(hashArgs) {
			return hashArgs[1];
		};
	}
	return function() {
		var key = hasher(arguments);
		if (structKeyExists(memo, key)){
			if (dateDiff("s", memo[key].timestamp + cachedWithin, now()) < 0){
				return memo[key].result;
			}
			structDelete(memo, key);
		}
		memo[key] = {
			result = func(argumentCollection = arguments),
			timestamp = now()
		};
		return memo[key].result;
	};
}

include "common.cfm";

heavyLifting = memoize(
	function(required string label) {
		var msg = "Executed for #label# at: #ts()#<br>";
		sleep(1000);
		return msg;
	},
	createTimespan(0,0,0,5)
);

// not cached
include "testCalls.cfm";

// cached
include "testCalls.cfm";

sleep(5000);

// decached
include "testCalls.cfm";
</cfscript>