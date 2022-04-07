<cfhttp url="http://quote.yahoo.com/download/quotes.csv?Symbols=csco,jnpr&format
=sc1l1&ext=.csv"
        method="GET"
        name="qStockItems"
        columns="Symbol,Change,LastTradedPrice"
        textqualifier=""""
        delimiter=","
        firstrowasheaders="no">  
 
<cfdump var="#qStockItems#">
<cfdump var="#qStockItems.getColumnNames()#">
<table border="1">
<tr><td>Column</td><td>Type via query</td><td>Type via query metaData</td></tr>
<cfoutput>
<cfloop from="1" to="#qStockItems.getColumnCount()#" index="x">
	<tr><td>#qStockItems.getColumnName(javacast("int", x))#</td><td>#qStockItems.getColumnTypeName(javacast("int", x))#</td><td>#qStockItems.getMetaData().getColumnTypeName(javaCast("int", x))#</td></tr>
</cfloop>
</cfoutput>
</table>

<!--- QoQ: wot don't work
<cfquery name="hello" dbtype="query">
SELECT SUM(val(qStockItems.LastTradedPrice)) AS SUMNOW from qStockItems; 
</cfquery> --->