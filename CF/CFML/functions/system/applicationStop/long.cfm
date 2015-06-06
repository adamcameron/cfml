<!---long.cfm --->

<cfflush interval="1">
<cfoutput>
#application.firstVar#<br />

<!---emulate a long-running request --->
<cfset sleep(10000)>

#application.secondVar#<br />
</cfoutput>
