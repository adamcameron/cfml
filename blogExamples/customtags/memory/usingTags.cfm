<cfimport prefix="dac" taglib = "lib/tags">

<cfset start = getTickCount()>
<dac:featureToggle feature="SOME_ENABLED_FEATURE">
	<cfset sleep(5000)>
</dac:featureToggle>
<cfoutput>Execution time: #getTickCount()-start#ms</cfoutput>