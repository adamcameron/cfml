<cfhttp url="http://proxy.espn.go.com/profile/affiliate/scores?sport=mlb&width=125" method="get" useragent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.1.8) Gecko/20071008 Firefox/2.0.0.8">

<cftry>
<cfset myXMLDoc = xmlParse(cfhttp.filecontent)>
<cfdump var="#myXmlDoc#">
	<cfcatch>
		<cfdump var="#cfcatch#" expand="false">
		<cfdump var="#cfhttp#" expand="false">
		<br />
		<cfdump var="#toString(cfhttp.filecontent)#" expand="false">
	</cfcatch>
</cftry>