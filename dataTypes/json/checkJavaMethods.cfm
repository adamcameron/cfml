<cfinclude template="./createRecords.cfm">

<cfset records2 = queryNew("id,strData,intData", "Integer,Varchar,Integer")>
<cfset records2.populate(deserialisedRecords)>
<cfdump var="#[records2,getMetadata(records2)]#">