<!--- simpleSwitchWithMultipleCaseValues.cfm --->
<cfswitch expression="#URL.option#">
	<cfcase value="a">
		<cfset result = 1>
	</cfcase>
	<cfcase value="b,c">
		<cfset result = 2>
	</cfcase>
	<cfcase value="d;e" delimiters=";">
		<cfset result = 3>
	</cfcase>
	<cfdefaultcase>
		<cfset result = 4>
	</cfdefaultcase>
</cfswitch>