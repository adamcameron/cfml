<cfscript>
o = new C()

try {
	writeOutput("testViaNoScope<br>")
	writeDump([
		result = o.testViaNoScope()
	])
}catch (any e) {
	writeDump([
		message = e.message,
		detail = e.detail
	])
}
writeOutput("<hr>")

try {
	writeOutput("testViaVariables<br>")
	writeDump([
		result = o.testViaVariables()
	])
}catch (any e) {
	writeDump([
		message = e.message,
		detail = e.detail
	])
}
writeOutput("<hr>")

try {
	writeOutput("testViaThis<br>")
	writeDump([
		result = o.testViaThis()
	])
}catch (any e) {
	writeDump([
		message = e.message, // LUCEE: OK. CF: error
		detail = e.detail
	])
}
writeOutput("<hr>")

try {
	writeOutput("testVariablesViaFunctionExpression<br>")
	writeDump([
		result = o.testVariablesViaFunctionExpression()
	])
}catch (any e) {
	writeDump([
		message = e.message,
		detail = e.detail
	])
}
writeOutput("<hr>")

try {
	writeOutput("testNoScopeViaFunctionExpression<br>")
	writeDump([
		result = o.testNoScopeViaFunctionExpression()
	])
}catch (any e) {
	writeDump([
		message = e.message,
		detail = e.detail
	])
}
writeOutput("<hr>")

try {
	writeOutput("testThisViaFunctionExpression<br>")
	writeDump([
		result = o.testThisViaFunctionExpression()
	])
}catch (any e) {
	writeDump([
		message = e.message, // LUCEE: OK. CF: error
		detail = e.detail
	])
}
writeOutput("<hr>")

try {
	writeOutput("testNestedFunctionExpression<br>")
	writeDump([
		result = o.testNestedFunctionExpression()
	])
}catch (any e) {
	writeDump([
		message = e.message, // LUCEE: OK. CF: error
		detail = e.detail
	])
}
writeOutput("<hr>")
</cfscript>
