<cfdocument name="pdf1" format="pdf">
	<cfdocumentitem type="header">
		<cfoutput>#cfdocument.currentpagenumber#</cfoutput>
	</cfdocumentitem>
	<cfoutput>This is PDF 1 at #timeFormat(now())#</cfoutput>
	<cfloop index="x" from="1" to="40">
		<p>
		doloras lorem upsom doloras paris hilton is my hero loreum ipsom dsoio foom an to dht end of the world
		will anyone actually read this probably not but let me put more realtext in so it flows a bit nicely
		<cfloop index="y" from="1" to="#randRange(1,9)#">This sentence will appear a random amount of time.</cfloop>
		</p>
	</cfloop>
</cfdocument>

<cfdocument name="pdf2" format="pdf">
	<cfdocumentitem type="header">
		<cfoutput>#cfdocument.currentpagenumber#</cfoutput>
	</cfdocumentitem>
	<cfoutput>This is PDF 2 at #timeFormat(now())#</cfoutput>
	<cfloop index="x" from="1" to="40">
		<p>
		doloras lorem upsom doloras paris hilton is my hero loreum ipsom dsoio foom an to dht end of the world
		will anyone actually read this probably not but let me put more realtext in so it flows a bit nicely
		<cfloop index="y" from="1" to="#randRange(1,9)#">This sentence will appear a random amount of time.</cfloop>
		</p>
	</cfloop>
</cfdocument>

<cfpdf action="merge" name="mergedpdf">
   <cfpdfparam source="pdf1">
   <cfpdfparam source="pdf2">
</cfpdf>

<cfcontent type="application/pdf" reset="true" variable="#toBinary(mergedpdf)#">