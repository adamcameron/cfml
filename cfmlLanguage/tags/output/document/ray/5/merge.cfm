<cfdocument name="pdf1" format="pdf">

<cfoutput>
This is PDF 1 at #timeFormat(now())#
</cfoutput>
</cfdocument>

<cfdocument name="pdf2" format="pdf">
<cfoutput>
This is PDF 2 at #timeFormat(now())#
</cfoutput>
</cfdocument>

<cfset savedFolder = expandPath("./pdfs")>

<cffile action="write" file="#savedFolder#/pdf1.pdf" output="#pdf1#">
<cffile action="write" file="#savedFolder#/pdf2.pdf" output="#pdf2#">

<cfpdf action="merge" directory="#savedFolder#" name="mergedpdf">

<cfcontent type="application/pdf" reset="true" variable="#toBinary(mergedpdf)#">