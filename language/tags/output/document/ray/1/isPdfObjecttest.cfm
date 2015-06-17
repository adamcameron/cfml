<cffile action="readbinary" file="#expandPath('../test.pdf')#" variable="oPdf">
<cfpdf action="read" source="#expandPath('../test.pdf')#" name="oPdf">

<cfif isPDFObject(oPdf)>
   mypdf is a PDF<br />
</cfif>

<cfif isPDFObject(request)>
   the request scope is a pdf.<br />
</cfif>