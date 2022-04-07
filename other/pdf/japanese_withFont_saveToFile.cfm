<cfprocessingdirective pageencoding="utf-8">

<cfset system = structKeyExists(server, "railo") ? "railo" : (structKeyExists(server, "bluedragon") ? "bluedragon" : "coldfusion")>
<cfset basePdfFileName = listFirst(listLast(getCurrentTemplatePath(), "\/"), ".")>
<cfset pdfFileName =  basePdfFileName & "_" & system &  ".pdf">
<cfset pdfFilePath =  expandPath('./#pdfFileName#')>

<cfset title = "Japanese via &lt;cfdocument&gt;">

<cfcontent type="application/pdf">
<cfheader name="Content-Disposition" value="attachment;filename=#pdfFileName#">
<cfdocument format="PDF" localurl="yes" marginTop=".25" marginLeft=".25" marginRight=".25" marginBottom=".25" pageType="custom" pageWidth="8.5" pageHeight="10.2">
	<cfoutput>
	<html>
	<head>
		<style>
			.japanese {
				font-family : mingliu;
			}
		</style>
		<title>#title#</title>
	</head>
	<body>
		<h1>#title#</h1>
		<p>#pdfFileName#</p>
		<div class="japanese">
			以呂波耳本部止<br>
			千利奴流乎和加<br>
			餘多連曽津祢那<br>
			良牟有為能於久<br>
			耶万計不己衣天<br>
			阿佐伎喩女美之<br>
			恵比毛勢須<br>
		</div>
	</body>
	</html>
</cfoutput>
</cfdocument>

