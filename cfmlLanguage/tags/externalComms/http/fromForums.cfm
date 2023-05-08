<CFHTTP method="get" redirect="true" resolveurl="true" charset="iso-8859-1" URL="http://www.cyberpresse.ca/apps/pbcs.dll/section?Category=CPRSS&amp;profile=5046&amp;mime=xml" useragent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.1.12) Gecko/20080201 Firefox/2.0.0.12">
	<cfhttpparam name="accept-encoding" type="header" value="deflate;q=0">
	<cfhttpparam name="TE" type="header"  value="deflate;q=0">
</CFHTTP>
<CFDUMP var = "#cfhttp#">
