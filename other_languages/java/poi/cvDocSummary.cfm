<cfscript>
	sDocPath	= expandPath("./");
	sSrcDocFile = sDocPath & "empty.doc";
	sDstDocFile = sDocPath & "new.doc";
	oFileStream = createObject("java", "java.io.FileInputStream").init(sSrcDocFile);
	oWord		= createObject("java", "org.apache.poi.hwpf.HWPFDocument").init(oFileStream);
	oDocSummaryInfo = oWord.getDocumentSummaryInformation();


	oCv = createObject("java", "ClassViewer");	
</cfscript>
<cfoutput>
	<pre>
		#oCv.viewObject(oDocSummaryInfo)#
	</pre>
</cfoutput>

<cfdump var="#variables#">
