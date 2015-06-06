<cfscript>
	rsImageFiles = queryNew("name");
	queryAddRow(rsImageFiles); querySetCell(rsImageFiles, "name", "Adam");
	queryAddRow(rsImageFiles); querySetCell(rsImageFiles, "name", "Betty");
	queryAddRow(rsImageFiles); querySetCell(rsImageFiles, "name", "Charlie");
	queryAddRow(rsImageFiles); querySetCell(rsImageFiles, "name", "Debbie");
</cfscript>
<cfxml variable="xmlObject" casesensitive="yes">
	<gallery>
		<album title="Product Detail">
			<cfoutput query="rsImageFiles">
				<img src = "http://www.testing.com/Images/Products/#rsImageFiles.Name#" caption = "Flat View" />
			</cfoutput>
		</album>
	</gallery>
</cfxml>
<cfsavecontent variable="xmlObject">
	<gallery>
		<album title="Product Detail">
			<cfoutput query="rsImageFiles">
				<img src = "http://www.testing.com/Images/Products/#rsImageFiles.Name#" z="fish" caption = "Flat View" />
			</cfoutput>
		</album>
	</gallery>
</cfsavecontent>
<cfset x = xmlParse(xmlObject)>
<cfoutput><pre>#htmlEditFormat(x)#</pre></cfoutput>