<cfscript>
// testCfHtmlToPdf.cfm
param URL.htmlUrl;

pdfDir = expandPath("./pdfs/");
pageName = listLast(URL.htmlUrl, "/");
pdfPath = pdfDir & pageName & ".pdf";
start = getTickCount();
cfhtmltopdf(source=URL.htmlUrl, destination=pdfPath, overwrite=true);
writeOutput("Execution time: #getTickCount()-start#ms");
</cfscript>