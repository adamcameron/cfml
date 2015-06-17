<cfapplication name="q">
<cfquery name="q" datasource="cfartgallery" cachedwithin="#createTimespan(1,0,0,0)#">
	SELECT	*
	FROM	artists
	<cfset u = createUuid()>
	WHERE	'#u#' = '#u#'
	
	<cfloop index="i" from="1" to="100">
		UNION ALL
		SELECT	*
		FROM	artists
		<cfset u = createUuid()>
		WHERE	'#u#' = '#u#'
	</cfloop>
</cfquery>
<cfdump var="#q#" top="10">