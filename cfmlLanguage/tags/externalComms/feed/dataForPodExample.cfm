<!--- Get the feed data as a query from the orders table. --->
<cfquery name="getOrders" datasource="cfartgallery">
    SELECT * FROM orders
</cfquery>

<!--- Map the orders column names to the feed query column names. --->
<cfset columnMapStruct = StructNew()>
<cfset columnMapStruct.publisheddate = "ORDERDATE">
<cfset columnMapStruct.content = "ADDRESS">
<cfset columnMapStruct.title = "CUSTOMERFIRSTNAME">
<cfset columnMapStruct.rsslink = "ORDERID">

<!--- Set the feed metadata. --->
<cfset meta.title = "Art Orders">
<cfset meta.link = "http://feedlink">
<cfset meta.description = "Orders at the art gallery">
<cfset meta.version = "rss_2.0">

<!--- Create the feed. --->
<cffeed action="create"
    query="#getOrders#"
    properties="#meta#"
    columnMap="#columnMapStruct#"
    xmlvar="rssXML">
<cfcontent reset="true" type="text/xml">
<cfoutput>#rssXml#</cfoutput>