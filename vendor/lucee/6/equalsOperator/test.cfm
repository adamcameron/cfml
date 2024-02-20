<cfscript>
o1 = new C()
o2 = o1

try {
	writeOutput(o1 === o2)
} catch (any e) {
	writeDUmp([
		type = e.type,
		message = e.message,
		detail = e.detail
	])
}

try {
	writeOutput(o1 == o2)
} catch (any e) {
	writeDUmp([
		type = e.type,
		message = e.message,
		detail = e.detail
	])
}
</cfscript>
