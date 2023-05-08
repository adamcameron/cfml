<cfscript>
// test.cfm	
a = new api.packageA.A()

runSafe("How variable access is reflected in a dump", ()->dump(var=a))

runSafe("Testing visibility of a public property from calling code", ()->echo(a.publicVar))

runSafe("Testing visibility of a package property from calling code", ()->echo(a.packageVar))

runSafe("Testing visibility of a private property from calling code", ()->echo(a.privateVar))


b = new api.packageB.B()
runSafe("Testing visibility of a package property from a different package", ()->echo(b.f()))

c = new api.packageA.C()
runSafe("Testing visibility of a package property from the same package", ()->echo(c.f()))


function runSafe(message, task){
	echo("<h3>#message#</h3>")
	try {
		task()
	} catch (any e){
		echo("#e.type# #e.message# #e.detail#")
	} finally {
		echo('<hr>');
	}
}
</cfscript>
