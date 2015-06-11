<!--- This example shows how to draw a square with rounded corners. --->
<!--- Create a 200x200-pixel image. --->
<cfset myImage=ImageNew("",200,200)>
<!--- Set the drawing color for the image to blue. --->
<cfset ImageSetDrawingColor(myImage,"white")>
<!--- Turn on antialiasing to improve image quality. --->
<cfset ImageSetAntialiasing(myImage,"on")>
<!--- Draw a blue filled square with round corners of arcWidth=10 and arcHeight=2. --->
<cfset ImageDrawRoundRect(myImage,5,5,190,190,20,20, "yes")>
<!--- Display the image in a browser. --->
<cfimage source="#myImage#" action="writeToBrowser">


<!--- Create an image. --->
<cfset myImage = imageNew("",100,100,"argb")>
<!--- Create a text attribute collection. --->
<cfset textStruct = structNew()>
<cfset textStruct.size=16>
<cfset textStruct.style="bold">
<cfset textStruct.font="Trebuchet MS">

<cfoutput>
<cfloop from="1" to="20" index="i">
    <!--- Turn on antialiasing to improve the quality of the rendered image. --->
    <cfset ImageSetAntialiasing(myImage,"on")>
    <!--- Set the background color. --->
    <cfset ImageSetBackgroundColor(myImage,"cyan") />
    <cfset ImageClearRect(myImage,0,0,myImage.getwidth(),myImage.getheight())>
    <!--- Set the drawing color. --->
    <cfset ImageSetDrawingColor(myImage,"black") />
    <!--- Draw a rectangle with rounded corners. --->
    <cfset ImageDrawRoundRect(myImage,10,10,myImage.width-20, myImage.height-20,i,i,"yes")>
    <!--- Set the text arc value. --->
    <cfset ImageSetDrawingColor(myImage,"##cccccc")>
    <cfset ImageDrawText(myImage, "#i#",30,30,textStruct)>
    <!--- Write the image to a file. --->
    <cfset imageWrite(myImage,"#expandPath("#i#.png")#")>
    <!--- Display the image. --->
    <img src="#i#.png">
</cfloop>
</cfoutput>
