<cfset sThisDir = expandPath("./")>

<cfset sSrcFile = "crash">
<cfset sSrcPdf	= "#sSrcFile#.pdf">

<cfset sDestPdf	= "#sSrcFile#_new.pdf">

<cfpdf	action	= "read"
	    name	= "oPdf"
	    source	= "#sSrcPdf#"
>

<cfpdf	action		= "write"
		destination	= "#sDestPdf#"
		source		= "oPdf"
>
