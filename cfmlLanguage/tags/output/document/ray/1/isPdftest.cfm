<cfif isPDFFile(expandPath("./isPdfTest.cfm"))>
   menu.cfm is a PDF!<br/>
</cfif>

<cfif isPDFFile(expandPath("../test.pdf"))>
   test.pdf is a PDF!<br/>
</cfif>