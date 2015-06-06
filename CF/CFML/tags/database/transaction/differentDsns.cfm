<cfquery name="qP" datasource="travel">
	select top 10 * from pages
</cfquery>

<cftransaction action="begin">
	<cfquery datasource="ITO" name="qB">
		select top 10 * from businesses
	</cfquery>
	<cfquery datasource="ITO" name="qBA">
		select top 10 * from business_activites
	</cfquery>

</cftransaction>

<cfdump var="#variables#">