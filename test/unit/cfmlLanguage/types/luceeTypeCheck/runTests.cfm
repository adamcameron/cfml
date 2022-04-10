<cfscript>
    import testbox.system.TestBox

	testBox = new TestBox(directories = "test.unit.cfmlLanguage.types.luceeTypeCheck")
	result = testBox.run(reporter="test.system.reports.SimpleReporter")
	writeOutput(result.trim())
</cfscript>
