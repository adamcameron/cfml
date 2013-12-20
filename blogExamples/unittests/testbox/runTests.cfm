<!--- runTests.cfm --->
<cfoutput>
	#new testbox.system.testing.TestBox(
		bundles="Tests"
	).run(
		reporter="simple"
	)#
</cfoutput>