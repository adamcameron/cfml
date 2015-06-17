<cfdocument format="pdf" name="mydocument">
<cfloop index="x" from="1" to="20">
<p>
doloras lorem upsom doloras paris hilton is my hero loreum ipsom dsoio foom an to dht end of the world
will anyone actually read this probably not but let me put more realtext in so it flows a bit nicely
<cfloop index="y" from="1" to="#randRange(1,9)#">This sentence will appear a random amount of time.</cfloop>
</p>
</cfloop>
</cfdocument>

<cfdocument format="pdf" name="watermark">
	<h1>Confidential</h1><br />
</cfdocument>

<cfset wfile = expandPath("./") & "wm.pdf">
<cffile action="write" file="#wfile#" output="#watermark#">

<cfpdf action="addWatermark" copyFrom="#wfile#" rotation="45" foreground="true" source="mydocument" name="mydocument" showonprint="true" overwrite="true" position="300,200">

<cfcontent type="application/pdf" reset="true" variable="#toBinary(mydocument)#">