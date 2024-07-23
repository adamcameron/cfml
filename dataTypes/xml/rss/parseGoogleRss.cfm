<cfhttp url="http://news.google.com/?output=rss" method="get" useragent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.1.8) Gecko/20071008 Firefox/2.0.0.8">

<cfset myXMLDoc = xmlParse(cfhttp.filecontent)>

<cfdump var="#myXmlDoc#">