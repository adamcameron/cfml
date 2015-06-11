<cfdocument format="pdf" name="mydocument" fontembed="true">
<cfloop index="x" from="1" to="20">
<p style="font-family:ShelleyAllegro BT;">
doloras lorem upsom doloras paris hilton is my hero loreum ipsom dsoio foom an to dht end of the world
will anyone actually read this probably not but let me put more realtext in so it flows a bit nicely
<cfloop index="y" from="1" to="#randRange(1,9)#">This sentence will appear a random amount of time.</cfloop>
</p>
</cfloop>
</cfdocument>
<cfcontent type="application/pdf" reset="true" variable="#toBinary(mydocument)#">