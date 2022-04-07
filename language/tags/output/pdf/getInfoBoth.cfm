<cfpdf	action	= "getinfo"
	    name	= "stPdf2"
	    source	= "#expandPath("./")#crash_new.pdf"
>

<cfpdf	action	= "getinfo"
	    name	= "stPdf1"
	    source	= "#expandPath("./")#crash.pdf"
>


<span style="font-size: x-small;">
<cfloop item="sKey" collection="#stPdf1#">
	<cfoutput>#sKey#:</cfoutput>
	<cfif stPdf1[sKey] eq stPdf2[sKey]>
		<cfoutput><span style="color:green">#stPdf1[sKey]#</span></cfoutput>
	<cfelse>
		<cfoutput><span style="color:red">#stPdf1[sKey]# : #stPdf2[sKey]#</span></cfoutput>
	</cfif>
	<br />
</cfloop>
</div>

<cfdump var="#stPdf1#" label="crash.pdf">
<cfdump var="#stPdf2#" label="crash_new.pdf">