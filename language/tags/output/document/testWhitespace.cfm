<cfset sContent = "x">
<cfdocument	format		= "PDF"
			filename	= "#expandPath('./')#test.pdf"
			overwrite	= "true"
			pageType	= "A4"
><cfoutput>#sContent#</cfoutput>
</cfdocument>
