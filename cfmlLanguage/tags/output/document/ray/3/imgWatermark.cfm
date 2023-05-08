<cfdocument format="pdf" name="mydocument">

<cfloop index="x" from="1" to="20">
<p>
doloras lorem upsom doloras paris hilton is my hero loreum ipsom dsoio foom an to dht end of the world
will anyone actually read this probably not but let me put more realtext in so it flows a bit nicely
<cfloop index="y" from="1" to="#randRange(1,9)#">This sentence will appear a random amount of time.</cfloop>
</p>
</cfloop>

</cfdocument>

<cfset textImage=ImageNew("",500,500,"grayscale","white")>

<cfset ImageSetDrawingColor(textImage,"black")>

<cfset attr=StructNew()>
<cfset attr.size=32>
<cfset attr.style="bold">
<cfset attr.font="Verdana">

<cfset ImageSetAntialiasing(textImage, "on")>

<cfset ImageDrawText(textImage,"Raymond Camden",50,50,attr)>

<cfpdf action="addWatermark" image="#textImage#" rotation="45" foreground="true" source="mydocument" name="mydocument" showonprint="true" overwrite="true" position="10,10">


<cfcontent type="application/pdf" reset="true" variable="#toBinary(mydocument)#">