<cfset sThisDir = expandPath("./")>
<cfpdf	action		= "thumbnail"
		source		= "#sThisDir#crash_new.pdf"
		destination	= "#sThisDir#"
		format		= "jpg"
		imagePrefix	= "thumb"
		overwrite	= "true"
		resolution	= "high"
		scale		= "100"
		pages		= "100"
>
