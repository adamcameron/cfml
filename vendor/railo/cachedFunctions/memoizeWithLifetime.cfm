<cfscript>
// memoizeWithLifetime.cfm

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
</cfscript>
