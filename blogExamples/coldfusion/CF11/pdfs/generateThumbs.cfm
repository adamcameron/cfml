<cfscript>
// generateThumbs.cfm
baseDir = getDirectoryFromPath(getCurrentTemplatePath());
pdfDir = baseDir & "pdfs/";
thumbDir = baseDir & "thumbs/";
directoryList(pdfDir, false, "array").each(function(pdfFile){
	cfpdf(
		action		= "thumbnail",
		source		= pdfFile,
		destination	= thumbDir,
		format		= "tiff",
		pages		= 1,
		maxlength	= 60,
		maxbreadth	= 60,
		overwrite	= true
	);
});
</cfscript>