<!--- Old --->
<cfset obj = createObject("java", "org.apache.commons.httpclient.HttpClient") />
<cfdump var="#obj#" />
 
 
<!--- New --->
<cfset obj = createObject("java", "org.apache.http.impl.client.CloseableHttpClient") />
<cfdump var="#obj#" />