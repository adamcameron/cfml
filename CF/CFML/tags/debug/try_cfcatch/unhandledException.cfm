<cftry>
	<!--- <cfthrow type="foo"> --->
	<cfset x = 1/0>
	<cfcatch type="notFoo">
		No Foo
	</cfcatch>
</cftry>