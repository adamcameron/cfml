<cfset sUrl = "http://syndication.apn.co.nz/rss/nzhrsscid_000000001.xml">
<cftry>
	<cffeed	source				= "#sUrl#"
			name				= "stFeed"
			action				= "read"
			enclosureDir		= "#expandPath('./')#enclosures/"
			ignoreEnclosureError= "true"
			overwrite			= "true"
			overwriteEnclosure	= "true"
			timeout				= "5"
			useragent			= "Mozilla/5.0 (Windows; U; Windows NT 5.2; en-GB; rv:1.9.0.6) Gecko/2009011913 Firefox/3.0.6"
	>
	<cfdump var="#stFeed#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>