<cfprocessingdirective pageencoding="utf-8">

<cfset system = "coldfusion">
<cfset basePdfFileName = listFirst(listLast(getCurrentTemplatePath(), "\/"), ".")>
<cfset pdfFileName =  basePdfFileName & "_" & system &  ".pdf">
<cfset pdfFilePath =  expandPath('./#pdfFileName#')>

<cfset title = "Japanese via &lt;cfdocument&gt;">
<cfdocument format="PDF" filename="#pdfFilePath#" overwrite="true">
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
			フェザーストンホーのチェア<br>
		</div>
	</body>
	</html>
</cfoutput>
</cfdocument>

