<cfscript>
pdfDirPath = GetDirectoryFromPath(GetCurrentTemplatePath());
pdfFilePath = pdfDirPath & "test.pdf"
cfpdf(
    action = "extracttext",
    source = pdfFilePath,
    pages = "*",
    honourspaces = true,
    type = "string",
    usestructure = true,
    name = "pdfData"
);

writeDump(pdfData)
</cfscript>
