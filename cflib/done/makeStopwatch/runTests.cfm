<!--- runTests.cfm --->
<cfoutput>
	#new testbox.system.testing.TestBox(
		bundles="TestMakeStopwatch"
	).run(
		reporter="simple"
	)#
</cfoutput>