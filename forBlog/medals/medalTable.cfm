<cfset CRLF = chr(13) & chr(10)>
<cfsavecontent variable="rendered">
<cfsetting enablecfoutputonly="true">
<cfoutput>
	<style>
	td,th {font-size:x-small;}
	.centre {text-align:center;}

table {
	border: 1px solid ##cef;
	text-align: left; }
th {
	font-weight: bold;
	background-color: ##def;
	border-bottom: 1px solid ##cef; }
td,th {
	padding: 4px 5px; }
	
.odd {
	background-color: ##def; }
.odd td {
	border-bottom: 1px solid ##cef; }
	
	</style>		
</cfoutput>
<cfoutput><table border="0" cellpadding="0" cellspacing="0" valign="top"></cfoutput>
	<cfoutput><thead></cfoutput>
		<cfoutput><tr></cfoutput>
			<cfoutput><th>Place</th></cfoutput>
			<cfoutput><th>Country</th></cfoutput>
			<cfoutput><th>&nbsp;G&nbsp;</th></cfoutput>
			<cfoutput><th>&nbsp;S&nbsp;</th></cfoutput>
			<cfoutput><th>&nbsp;B&nbsp;</th></cfoutput>
			<cfoutput><th>Total</th></cfoutput>
			<cfoutput><th>Pop. (M)</th></cfoutput>
			<cfoutput><th>Ratio</th></cfoutput>
		<cfoutput></tr></cfoutput>
	<cfoutput></thead></cfoutput>
	<cfoutput><tbody></cfoutput>
	<cfset rowToggle=0>
	<cfloop index="i" from="1" to="#arrayLen(countriesInOrder)#">
		<cfset country = countriesInOrder[i]>
		<cfif i LE 3 or listFindNoCase(watchList, country)>
		<cfset thisCountry = countries[country]>
			<cfoutput><tr<cfif rowToggle++ mod 2> class="odd"</cfif>></cfoutput>
				<cfoutput><td><cfif thisCountry.total>#i#<cfelse>-</cfif></td></cfoutput>
				<cfoutput><td>#Country#</td></cfoutput>
				<cfoutput><td class="centre">#thisCountry.gold#</td></cfoutput>
				<cfoutput><td class="centre">#thisCountry.silver#</td></cfoutput>
				<cfoutput><td class="centre">#thisCountry.bronze#</td></cfoutput>
				<cfoutput><td class="centre">#thisCountry.total#</td></cfoutput>
				<cfoutput><td class="centre">#roundPopulation(thisCountry.population)#</td></cfoutput>
				<cfoutput><td class="centre">#decimalFormat(thisCountry.ratio)#</td></cfoutput>
			<cfoutput></tr></cfoutput>
		</cfif>
	</cfloop>
	<cfoutput></tbody></cfoutput>
<cfoutput></table>#CRLF##CRLF#</cfoutput>
<cfsetting enablecfoutputonly="false">

</cfsavecontent>
<cfset rendered = replaceList(rendered, "United States of America,People's Republic of China,Great Britain,New Zealand,Russian Federation,Republic of Moldova,Democratic People's Republic  of Korea,Republic of Korea", "USA,China,GB,NZ,Russia,Moldova,North Korea,South Korea")>
<cfoutput>#rendered#</cfoutput>