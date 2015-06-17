<cfset t1Selected = false>
<cfset t2Selected = false>
<cfset t3Selected = false>

<cfif structKeyExists(form, "doit1")>
   <cfset t1Selected = true>
<cfelseif structKeyExists(form, "doit2")>
   <cfset t2Selected = true>
<cfelse>
   <cfset t3Selected = true>
</cfif>

<cflayout type="tab">
   <cflayoutarea title="Tab1" selected="#t1Selected#" />
   <cflayoutarea title="Tab2" selected="#t2Selected#" />
   <cflayoutarea title="Tab3" selected="#t3Selected#" />
</cflayout>