<cfscript>

function wrapper(v) {
    var it = v;
    var add = function(v) {
        it += v;
    };
	var getcount = function () {
		return it;
	};
    return {
        "add"= add,
        "getCount"= getCount
    };
}

foo = wrapper(5);
foo.add(10);
foo.add(20);
writeDump(foo.getCount() == 35);
</cfscript>