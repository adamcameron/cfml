<cfsetting showdebugoutput="false">
<cfsilent>
<cfsavecontent variable="table">
<cfcache action="cache" stripwhitespace="true" timeout="#createTimespan(0,1,0,0)#">
<cfscript>
	// get the medal table from the london2012 site
	httpService = new com.adobe.coldfusion.Http(
		method		= "get",
		url			= "http://www.london2012.com/paralympics/medals/medal-count/",
		useragent	= CGI.HTTP_USER_AGENT
	);

	// need to set the ACCEPT param otherwise the website things we're a bot, and 403s our request
	httpService.addParam(
		type	= "header",
		name	= "accept",
		value	= CGI.HTTP_ACCEPT
	);
	httpResponse = httpService.send().getPrefix();	// it's not the "prefix" (whatever that is), it's the HTTP response

	// if we got a proper response, then process it (or just dump out what we DID get at the bottom)
	if (httpResponse.responseHeader.status_code == 200){
		// find the medal table
		markup = httpResponse.fileContent;
		medalTableMatch = reMatchNoCase('<div id="overall_medals"[^>]+><table.+?</table></div>', markup);
		if (arrayLen(medalTableMatch) >= 1){
			medalTableXml = xmlParse(medalTableMatch[1]);

			// I've stored the country populations separately, as it's data, not code. The country names in this must match those used by the London 2012 site
			populationsJson = fileRead(expandPath("./populations.js"), "UTF-8");
			countries = deserializejson(populationsJson);

			// this is the list to include in the output table (I like the first three, plus these ones)
			include "./paralympicWatchlist.cfm";

			// grab the first three countries from the main table, and add them to the watch list if they're not on it already
			allCountries = xmlSearch(medalTableXml, "//td/div/div/a/span[@class='countryName']");
			for (i=1; i <= 3; i++){
				topThreeCountry = allCountries[i].xmlText;
				if (!listFindNoCase(watchList, topThreeCountry)){
					watchList = listAppend(watchList, topThreeCountry);
				}
			}

			// now process all the other countries
			// this might not be the best xpath query possible, but it works. We swap the actual country name in in place of {country}
			templateXPathToMedal = "//td/div/div/a/span[@class='countryName'][text()=""{country}""]/parent::*/parent::*/parent::*/parent::*/following-sibling::*";

			// process ALL the countries (not just the watchList) so we can get each country's placing in the table
			for (country in countries){
				xPathToMedalForCountry = replace(templateXPathToMedal, "{country}", country);
				medalsXml = xmlSearch(medalTableXml, xPathToMedalForCountry);
				if (arrayLen(medalsXml) >= 3){	// there are a lot of other TDs in that row, but the only ones we want are the GSB ones.  Couldn't work out how to get the xpath to only return these ones..?
					countries[country].gold = medalsXml[1].xmlText;
					countries[country].silver = medalsXml[2].xmlText;
					countries[country].bronze = medalsXml[3].xmlText;
				}else{
					countries[country].gold		= 0;
					countries[country].silver	= 0;
					countries[country].bronze	= 0;
				}
				countries[country].total	= countries[country].gold + countries[country].silver + countries[country].bronze;
				countries[country].ratio	= (countries[country].total) / (countries[country].population / 10^6) ;	// ie: medals per one million people
			}
			// order them by the "column" we want to order the display by
			countriesInOrder = structSort(countries, "numeric" , "desc", "ratio");
			// this has got mark-up in it, so abstract it out
			include "./paralympicMedalTable.cfm";
		}else{	// oops, they've changed the format on me...
			writeOutput("Couldn't find the medal table!");
			writeDump(httpResponse.responseHeader);
		}
	}else{
		writeDump(httpResponse.responseHeader);
	}


	// from CFLIB
	function roundSigFig(number, digits) {
		var iLog	= 0;
		var iTemp	= 0;
		var fReturn	= 0;

		if (number != 0) {
			iLog	= int(Log10(Sgn(number)*number+0.0));
			iTemp	= round(number / (10 ^ (iLog-digits+1)));
			fReturn	= iTemp * (10 ^ (iLog-digits+1));
		}
		return fReturn;
	}

	function roundPopulation(population){
		var pop = thisCountry.population / 10^6;
		if (pop >= 100){
			return int(pop);
		}else{
			return roundSigFig(pop, 3);
		}
	}

</cfscript>
</cfcache>
</cfsavecontent>
<cfset jsResponse = '#URL.callback#(#URL.handler#({table:"#jsStringFormat(table)#"}));'>
</cfsilent><cfoutput>#table#</cfoutput>