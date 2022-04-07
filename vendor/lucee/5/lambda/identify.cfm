<cfscript>
// identify.cfm

function f(x,y){
	return x*y
}

g = function(x,y) {
	return x*y
}

h = (x,y) -> x*y

dump(var={
	isCustomFunction=isCustomFunction(f),
	isClosure=isClosure(f)
}, label="Function statement")


dump(var={
	isCustomFunction=isCustomFunction(g),
	isClosure=isClosure(g)
}, label="Function expression")


dump(var={
	isCustomFunction=isCustomFunction(h),
	isClosure=isClosure(h)
}, label="Arrow function")
</cfscript>