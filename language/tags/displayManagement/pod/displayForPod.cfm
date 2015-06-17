<cffeed action="read" source="http://localhost:8305/shared/cf/cfml/8/feed/dataForPodExample.cfm" query="feedQuery" properties="feedMetadata" >

<cfloop query = "feedQuery" startRow="#url.start#" endRow="#url.start#">
    <cfoutput>#feedQuery.content#<br />
    =========================================<br/>
    </cfoutput>
</cfloop>