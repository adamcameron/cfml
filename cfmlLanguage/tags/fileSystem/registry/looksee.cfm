<cfflush interval="20">
<cfregistry action="getAll" branch="HKEY_LOCAL_MACHINE\SOFTWARE\Macromedia\ColdFusion\CurrentVersion\Clients" type="any" name="regData">

<cfoutput query="regData">
	Deleting [#entry#]#repeatString(" ", 100)#
	<cftry>
		<cfregistry action="delete" branch="HKEY_LOCAL_MACHINE\SOFTWARE\Macromedia\ColdFusion\CurrentVersion\Clients\#entry#">
		<span style="color:green">[SUCCESS]</span>#repeatString(" ", 100)#
		<cfcatch>
			<span style="color:red">[FAILED]</span>#repeatString(" ", 100)#
		</cfcatch>
	</cftry>
	<br />#repeatString(" ", 100)#
</cfoutput>
