<cfscript>
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
	
	stColours = structNew();
	stColours["Cat"]	= "Red";
	stColours["Dog"]	= "Green";
	stColours["Fish"]	= "Blue";
	stColours["Bird"]	= "Yellow";
</cfscript>

<cfchart format="flash" chartheight="800" chartwidth="600" seriesplacement="stacked" showlegend="true" show3d="true">
	<cfchartseries type="bar" query="q" itemcolumn="pet" valuecolumn="count" colorlist="red,green,blue,yellow">
		<cfchartdata item="#q.pet[currentRow]#" value="#q.count[currentRow]#">
	</cfchartseries>
</cfchart>
