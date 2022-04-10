<cfflush interval="128">
<cfset lTypes="simple,explicit,internet,internet_basic,natural">
<cfset lCollections = "testVerityEnglish,testSolrEnglish,testLuceneEnglish">
<cfloop index="sCollection" list="#lCollections#">
	<cfoutput><h2>#sCollection#</h2></cfoutput>
	<cfloop index="sType" list="#lTypes#">
		<cftry>
			<cfsearch collection="#sCollection#" criteria="e" maxrows="1" name="qSearch" status="stSearch" type="#sType#">
			<cfdump var="#qSearch#" label="qSearch">
			<cfdump var="#stSearch#" label="stSearch">
			<cfcatch>
				<cfoutput>#cfcatch.message#<br />#cfcatch.detail#<br /><br /></cfoutput>
			</cfcatch>
		</cftry>
	</cfloop>
	<hr />
</cfloop>