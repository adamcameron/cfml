<cfsetting enablecfoutputonly="true">
<cffile action="write" file="#expandPath('./test.jpg')#" charset="utf-8">
	<cfimage action="read" name="oImg" source="#expandPath('./Z.JPG')#">
	<cfoutput>#toBase64(imageGetBlob(oImg))#</cfoutput>
</cffile>