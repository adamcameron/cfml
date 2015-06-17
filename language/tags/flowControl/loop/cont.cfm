<cfloop index="x" from="1" to="10">
 
  <cfif x eq 1>
    First Element<br/>
    <cfcontinue>
  </cfif>
 
 Now we can do something with elements <cfoutput>#x#-10</cfoutput><br/>
</cfloop>

