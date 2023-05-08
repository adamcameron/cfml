<cfsetting enablecfoutputonly="true">
<cfparam name="URL.format" default="HTML">

<cfset cFormFeed = chr(12)>
<cfsavecontent variable="sDoc">
<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><title>Anchor test</title></head>
<body>
	<h1>Anchor test</h1>

	<a name="page1Dedicated"></a>
	<h2>This is Page 1</h2>
	<p>
		<a href="##page2Dedicated">Goto Page 2 via dedicated anchor</a>
		<br />
		<a name="page1" href="##page2">Goto Page 2 via name and anchor combined</a>
	</p>
	<p>#repeatString("Content here<br/>",50)#</p>
	#cFormFeed#

	<a name="page2Dedicated"></a>
	<h2>This is Page 2</h2>
	<p>
		<a href="##page1Dedicated">Goto Page 1 via dedicated anchor</a>
		<br />
		<a name="page2" href="##page1">Goto Page 1 via name and anchor combined</a>
	</p>
	<p>#repeatString("Content here<br/>",50)#</p>
</body></html>
</cfoutput>
</cfsavecontent>

<cfcontent reset="true">
<cfif URL.format eq "PDF">
	<cfdocument format="pdf">
		<cfoutput>#listFirst(sDoc, cFormFeed)#</cfoutput>
		<cfdocumentitem type="pagebreak" />
		<cfoutput>#listLast(sDoc, cFormFeed)#</cfoutput>
	</cfdocument>
<cfelse><!--- Just HTML --->
	<cfoutput>#replace(sDoc, cFormFeed, "<hr />", "ALL")#</cfoutput>
</cfif>