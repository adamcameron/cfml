<!--- Set some defaults used by each image type, unless you override them --->
<cfparam name="jpgQuality" default=".8" />
<cfparam name="defaultInterpolation" default="bicubic" />
<cfparam name="defaultBackground" default="black" />

 

<!--- Set values for each image type --->
<cfparam name="thumbMaxWidth" default="" />  <!--- leave blank to allow any width (forced to size by height) --->
<cfparam name="thumbMaxHeight" default="60" /> <!--- leave blank to allow any height (forced to size by width, above) --->
<cfparam name="thumbQuality" default="1" />  <!--- number from 0 - 1, 1 being the best --->
<cfparam name="thumbFixedSize" default="false" />  <!--- you MUST set both MaxWidth & MaxHeight to use FixedSize --->
<cfparam name="thumbBackground" default="#defaultBackground#" />  <!--- color of background if fixed size is used --->
<cfparam name="thumbInterpolation" default="#defaultInterpolation#" />  <!--- Interpolation method used for resizing (HUGE performance hit depending on what is used) --->
<cfparam name="normalMaxWidth" default="476" />
<cfparam name="normalMaxHeight" default="324" />
<cfparam name="normalQuality" default="#jpgQuality#" />
<cfparam name="normalFixedSize" default="true" />
<cfparam name="normalBackground" default="#defaultBackground#" />
<cfparam name="normalInterpolation" default="#defaultInterpolation#" />
<cfparam name="zoomMaxWidth" default="670" />
<cfparam name="zoomMaxHeight" default="380" />
<cfparam name="zoomQuality" default="#jpgQuality#" />
<cfparam name="zoomFixedSize" default="true" />
<cfparam name="zoomBackground" default="#defaultBackground#" />
<cfparam name="zoomInterpolation" default="#defaultInterpolation#" />

 


<!--- Set values for folder paths and the watermark image --->
<cfparam name="originalFolder" default="#expandPath('./original/')#" />
<cfparam name="thumbFolder" default="#expandPath('./thumb/')#" />
<cfparam name="normalFolder" default="#expandPath('./normal/')#" />
<cfparam name="zoomFolder" default="#expandPath('./zoom/')#" />
<cfparam name="watermarkImage" default="" />
<cfparam name="wmXPosition" default="50" />  <!--- value is a number from 0 - 100, 50 = centered --->
<cfparam name="wmYPosition" default="65" />

 

<cffunction name="genWatermarkImage">
    <cfargument name="ImageFile" required="true" />
    <cfargument name="MaxWidth" required="true" />
    <cfargument name="MaxHeight" required="true" />
    <cfargument name="StorePath" required="true" />
    <cfargument name="FixedSize" required="true" type="Boolean" />
    <cfargument name="Background" required="true" />
    <cfargument name="Quality" required="true" />
    <cfargument name="Interpolation" required="true" />
    <cfargument name="AddWatermark" required="true" type="Boolean" />
    <cfif IsImageFile(originalFolder & ImageFile)>
        <cfset original = ImageNew(originalFolder & ImageFile) />
        <cfset originalHeight = ImageGetHeight(original) />
        <cfset originalWidth = ImageGetWidth(original) />
        <cfset outfile = StorePath & ImageFile />
        <cfset ImageScaleToFit(original,MaxWidth,MaxHeight,Interpolation) />
        <cfset new_w = ImageGetWidth(original) />
        <cfset new_h = ImageGetHeight(original) />
        <cfif FixedSize>
            <cfset normal = ImageNew("",MaxWidth,MaxHeight,"rgb",Background) />
            <cfset ImagePaste(normal,original,int((MaxWidth-new_w)/2),int((MaxHeight-new_h)/2)) />
            <cfif AddWatermark>
		        <cfset watermark = ImageNew(watermarkImage) />
                <cfset ImagePaste(normal,watermark,( int(ImageGetWidth(normal)) - int(ImageGetWidth(watermark)) -3),( int(ImageGetHeight(normal)) - int(ImageGetHeight(watermark)) -3) )/>
            </cfif>
            <cfset ImageWrite(normal,outfile,Quality) />
        <cfelse>
            <cfif AddWatermark>
		        <cfset watermark = ImageNew(watermarkImage) />
                <cfset ImagePaste(original,watermark,( int(ImageGetWidth(normal)) - int(ImageGetWidth(watermark)) -3), (int(ImageGetHeight(normal)) - int(ImageGetHeight(watermark)) -3) )/>
            </cfif>
			<cfdump var="#local#" abort="true" >
            <cfset ImageWrite(original,outfile,Quality) />
        </cfif>
    <cfelse>
        <cfreturn "Image file not an image!" />
    </cfif>
</cffunction>

 

<cfset thumbError = genWatermarkImage('originalImage.jpg' ,thumbMaxWidth,thumbMaxHeight,thumbFolder,thumbFixedSize,thumbBackground,thumbQuality,thumbInterpolation,"false") />