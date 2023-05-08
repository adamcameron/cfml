<cfset q = new Query(datasource="cfbookclub", sql="SELECT * FROM authors").execute().getResult()>
<cfdump var="#q#">