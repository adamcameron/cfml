<cftry>
	<cfthrow errorcode="code" type="test" detail="detail" message="msg" extendedinfo="extended">
	<cfcatch>
		<cfdump var="#cfcatch#" label="#listSort(structKeyList(cfcatch), 'TextNoCase')#">
	</cfcatch>
</cftry>