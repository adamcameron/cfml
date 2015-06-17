<cfscript>

	// set up some data
	q = queryNew("year,pet,count");

	queryAddRow(q); querySetCell(q, "year", "2000"); querySetCell(q, "pet", "Cat"); querySetCell(q, "count", 5);
	queryAddRow(q); querySetCell(q, "year", "2001"); querySetCell(q, "pet", "Cat"); querySetCell(q, "count", 8);
	queryAddRow(q); querySetCell(q, "year", "2002"); querySetCell(q, "pet", "Cat"); querySetCell(q, "count", 1);
	queryAddRow(q); querySetCell(q, "year", "2003"); querySetCell(q, "pet", "Cat"); querySetCell(q, "count", 2);
	queryAddRow(q); querySetCell(q, "year", "2004"); querySetCell(q, "pet", "Cat"); querySetCell(q, "count", 11);
	queryAddRow(q); querySetCell(q, "year", "2005"); querySetCell(q, "pet", "Cat"); querySetCell(q, "count", 8);

	queryAddRow(q); querySetCell(q, "year", "2000"); querySetCell(q, "pet", "Dog"); querySetCell(q, "count", 10);
	queryAddRow(q); querySetCell(q, "year", "2001"); querySetCell(q, "pet", "Dog"); querySetCell(q, "count", 4);
	queryAddRow(q); querySetCell(q, "year", "2002"); querySetCell(q, "pet", "Dog"); querySetCell(q, "count", 3);
	queryAddRow(q); querySetCell(q, "year", "2003"); querySetCell(q, "pet", "Dog"); querySetCell(q, "count", 4);
	queryAddRow(q); querySetCell(q, "year", "2004"); querySetCell(q, "pet", "Dog"); querySetCell(q, "count", 7);
	queryAddRow(q); querySetCell(q, "year", "2005"); querySetCell(q, "pet", "Dog"); querySetCell(q, "count", 4);

	queryAddRow(q); querySetCell(q, "year", "2000"); querySetCell(q, "pet", "Fish"); querySetCell(q, "count", 7);
	queryAddRow(q); querySetCell(q, "year", "2001"); querySetCell(q, "pet", "Fish"); querySetCell(q, "count", 2);
	queryAddRow(q); querySetCell(q, "year", "2002"); querySetCell(q, "pet", "Fish"); querySetCell(q, "count", 5);
	queryAddRow(q); querySetCell(q, "year", "2003"); querySetCell(q, "pet", "Fish"); querySetCell(q, "count", 8);
	queryAddRow(q); querySetCell(q, "year", "2004"); querySetCell(q, "pet", "Fish"); querySetCell(q, "count", 5);
	queryAddRow(q); querySetCell(q, "year", "2005"); querySetCell(q, "pet", "Fish"); querySetCell(q, "count", 2);

	queryAddRow(q); querySetCell(q, "year", "2003"); querySetCell(q, "pet", "Bird"); querySetCell(q, "count", 15);
	queryAddRow(q); querySetCell(q, "year", "2004"); querySetCell(q, "pet", "Bird"); querySetCell(q, "count", 3);
	queryAddRow(q); querySetCell(q, "year", "2005"); querySetCell(q, "pet", "Bird"); querySetCell(q, "count", 1);
</cfscript>

<!--- Create the chart --->
<cfchart seriesplacement="stacked" showlegend="true">
	<cfoutput query="q" group="pet">
		
		<cfchartseries type="bar" serieslabel="#pet#">
			<cfoutput>
				<cfchartdata item="#year#" value="#count#">
			</cfoutput>
		</cfchartseries>
	</cfoutput>
</cfchart>
