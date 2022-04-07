<!---
<cfpdf	action		= "thumbnail"
		source		= "#arguments.iFile#"
		destination	= "#oPath#"
		format		= "jpg"
		imagePrefix	= "#arguments.alias#"
		overwrite	= "true"
		resolution	= "high"
		scale		= "100"
>
 --->
<cfparam name="URL.page" default="1">
<cfset sThisDir = expandPath("./")>
<cfpdf	action		= "thumbnail"
		source		= "#sThisDir#crash_new.pdf"
		destination	= "#sThisDir#"
		format		= "jpg"
		imagePrefix	= "thumb#URL.page#"
		overwrite	= "true"
		resolution	= "high"
		scale		= "100"
		pages		= "100"
>

<!---
<cfpdf	action		= "thumbnail"
		source		= "myBook.pdf"
		pages		= "1"
		destination	= "#sThisDir#"
    	imagePrefix	= "Cover"
		format		= "png"
		scale		= "50"
		resolution	= "low"
>
 --->