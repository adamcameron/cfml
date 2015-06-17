<cfset sDir = expandPath('./')>
<cfset sSrcImg = sDir & "originalImage.jpg">
<cfset sDestImg = sDir & "thumbImage.jpg">

<cfset imgOriginal = imageNew(sSrcImg)>
<cfset imageScaleToFit(imgOriginal, "", 60, "bicubic")>
<cfset imageWrite(imgOriginal, sDestImg, .8)>
