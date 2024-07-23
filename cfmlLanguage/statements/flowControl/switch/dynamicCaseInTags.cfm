<!--- dynamicCaseInTags.cfm--->
<cfswitch expression="#URL.option#">
	<cfcase value="1">
		one
	</cfcase>
	<cfcase value="2">
		two
	</cfcase>
	<cfcase value="#URL.favourite#">
		the favourite one: <cfoutput>#URL.favourite#</cfoutput>
	</cfcase>
	<cfdefaultcase>
		the default
	</cfdefaultcase>
</cfswitch>