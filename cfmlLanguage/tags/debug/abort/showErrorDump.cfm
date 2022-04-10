<cftry>
	<cfabort showerror="foo">
	<cfcatch>
		<cfdump var="#cfcatch#">
		
		<cfloop index="sKey" list="type,message,detail">
			<cfoutput>#sKey# : #cfcatch[sKey]#<br /></cfoutput>
		</cfloop>
	</cfcatch>
</cftry>