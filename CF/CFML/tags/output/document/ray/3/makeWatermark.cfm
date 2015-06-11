<cfdocument format="pdf" name="watermark">
<h1>Raymond Camden</h1><br />
<h1><cfoutput>#dateformat(now(),"short")# #timeformat(now(), "short")#</cfoutput></h1>
</cfdocument>

<cfset wfile = expandPath("./") & "wm.pdf">
<cffile action="write" file="#wfile#" output="#watermark#">