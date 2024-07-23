<cfxml variable="xTest">
   <jobs>
      <job>
         <employee code="0" />
         <employee code="1" />
         <employee code="2" />
         <employee code="3" />
      </job>
   </jobs>
</cfxml>
<cfset aSearch = xmlSearch(xTest, "/jobs/job/employee[@code=2]/preceding-sibling::*")>
<cfset idx = arrayLen(aSearch)+1>

<cfdump var="#idx#">