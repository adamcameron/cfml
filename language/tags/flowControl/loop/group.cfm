<cffunction name="getData" returntype="query">
	<cfset var q = "">
	<cfquery name="q" datasource="cfartgallery">
		SELECT		artists.artistid, artists.firstname, artists.lastname, art.artname
		FROM		art
		INNER JOIN	artists
		ON	art.artistid = artists.artistid
		ORDER BY	artists.lastname, artists.firstname
		
	</cfquery>
	<cfreturn q>
</cffunction>

<cfloop query="#getData()#" group="artistid">
	<cfoutput>#artistid# #firstname# #lastname#</cfoutput><br />
	<cfloop>
		<cfoutput>#artname#</cfoutput><br />
	</cfloop>
	<hr />
</cfloop>