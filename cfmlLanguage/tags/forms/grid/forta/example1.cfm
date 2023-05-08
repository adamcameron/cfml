<cfquery name="artists" datasource="cfartgallery">
SELECT artistid, lastname, firstname, email
FROM artists
ORDER BY lastname, firstname
</cfquery>

<cfform>
	 <cfgrid name="artists"
				 format="html"
				 striperows="yes"
				 query="artists">
			<cfgridcolumn name="lastname" header="Last Name" width="100"/>
			<cfgridcolumn name="firstname" header="First Name" width="100"/>
			<cfgridcolumn name="email" header="E-Mail" width="200"/>
	 </cfgrid>
</cfform>