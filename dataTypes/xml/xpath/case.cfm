<cfxml variable="xmlFeed">

	<items>
		<item>
			<title>I Love ColdFusion</title>
			<description>ColdFusion is amazing!</description>
			<link>http://www.bennadel.com</link>
		</item>
		<item>
			<title>I Want To Swim In A Pudding Bath</title>
			<description>Author talks about why it would be awesome to swim around in a bathtub full of pudding.</description>
			<link>http://www.bennadel.com</link>
		</item>
		<item>
			<title>I Think ColdFusion Knocked Up My Daughter</title>
			<description>Author described a conspiracy theory in which he things his ColdFusion application server impregnated his daughter in an attempt to spawn a race of super humans with amazing back-end processing!</description>
			<link>http://www.bennadel.com</link>
		</item>
		<item>
			<title>Christina Cox Is A Hottie</title>
			<description>Author talks about actress Christina Cox and what makes her such a hottie.</description>
			<link>http://www.bennadel.com</link>
		</item>
		<item>
			<title>COLDFusion Is So Hot!</title>
			<description>Author describes what make ColdFusion such a hot technology.</description>
			<link>http://www.bennadel.com</link>
		</item>
	</items>

</cfxml>

<cfset aCase = xmlSearch(xmlFeed, "//item[contains(title/text(), 'COLDFusion')]")>
<cfdump var="#aCase#">
<cfset aNoCase1 = xmlSearch(xmlFeed, "//item[contains(translate(title/text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'coldfusion')]")>
<cfdump var="#aNoCase1#">
<cfset aNoCase2 = xmlSearch(lcase(xmlFeed), lcase("//item[contains(title/text(), 'COLDFusion')]"))>
<cfdump var="#aNoCase2#">


