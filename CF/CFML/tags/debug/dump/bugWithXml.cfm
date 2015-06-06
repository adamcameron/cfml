<cfflush interval="64">
<cfhttp url="http://sunrisewholesalemerchandise.com/swInventory.xml" method="get" />
<cfif cfhttp.responseheader.status_code EQ 200>
	<!---<cfdump var="#cfhttp.FileContent#">--->
	<cfset begin = #Find("<?xml",cfhttp.FileContent)#>
	<cfif begin>
			<cfscript>
			begin = begin -1;
			xmlDoc = RemoveChars(CFHTTP.FileContent,1,begin);
			//writeDump(var=xmlDoc, label="xmlDoc");
			x = XMLParse(xmlDoc);
		</cfscript>
		<cfdump var="#x#">
	</cfif>
</cfif>