<cfparam name="cfc" type="string" default="cfml">
<cfif len(cfc)>
	<cftry>
		<cfscript>
			theObj = createObject("component",cfc);
		</cfscript>

		<cfdump var="#theObj#">
		
		<cfcatch>
			Couldn't dump the cfc.<br> 
			<cfoutput>
			#cfcatch.message#<br>
			#cfcatch.detail#
			</cfoutput>
		</cfcatch>
	</cftry>
</cfif>