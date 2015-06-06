<cfset sThisDir = expandPath('./')>

<cfzip	action = "unzip"
		destination = "#sThisDir#dest/"
		file = "#sThisDir#dest/nopath.zip"
		overwrite = "true"
		recurse = "true"
		storePath = "false"
>
