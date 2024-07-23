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

<cfset sThisDir = expandPath("./")>
<cfpdf	action		= "thumbnail"
		source		= "#sThisDir#crash_new.pdf"
		destination	= "#sThisDir#"
		format		= "jpg"
		imagePrefix	= "thumb"
		overwrite	= "true"
		resolution	= "high"
		scale		= "100"
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