<cfdocument format="pdf" name="mydocument">

   <cfloop index="x" from="1" to="15">
   <p>
   lorem upsom doloras paris hilton is my hero loreum ipsom dsoio foom an to dht end of the world
   will anyone actually read this probably not but let me put more realtext in so it flows a bit nicely
      <cfloop index="y" from="1" to="#randRange(1,9)#">This sentence will appear a random amount of time.</cfloop>
   </p>
   </cfloop>

</cfdocument>


<cfpdf action="deletepages" pages="1" source="mydocument" name="mydocument">

<cfcontent type="application/pdf" reset="true" variable="#toBinary(mydocument)#">