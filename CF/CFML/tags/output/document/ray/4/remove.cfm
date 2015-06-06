<cfdocument format="pdf" name="mydocument">
<cfloop index="x" from="1" to="40">
<p>
doloras lorem upsom doloras paris hilton is my hero loreum ipsom dsoio foom an to dht end of the world
will anyone actually read this probably not but let me put more realtext in so it flows a bit nicely
<cfloop index="y" from="1" to="#randRange(1,9)#">This sentence will appear a random amount of time.</cfloop>
</p>
</cfloop>
</cfdocument>

<cfpdf action="getinfo" source="mydocument" name="data">

<cfoutput>
<p>
Total pages: #data.totalpages#
</p>
</cfoutput>

<cfpdf action="deletepages" source="mydocument" pages="1-3" overwrite="true" name="mydocument">

<cfpdf action="getinfo" source="mydocument" name="data">

<cfoutput>
<p>
Total pages now: #data.totalpages#
</p>
</cfoutput>