<cfxml variable="testdoc">
<doc>
       <header>
               <author>John Doe</author>
       </header>
       <content language="en" charset="iso-8859-1">
       </content>
</doc>
</cfxml>

<cfdump var="#testdoc#">

<cfset test1 = xmlSearch(testdoc, "//author/text()")>
<cfdump var="#test1#">

<cfset test2 = xmlSearch(testdoc, "string(//author/text())")>
<cfdump var="#test2#">