<cfparam name="URL.file">
<cfparam name="URL.text">
<cfparam name="URL.size">
<cfdocument format="PDF" filename="#expandPath('./')##URL.file#" overwrite="true">
	<cfset sPadding = "padding">
	<cfset iSize = 0>
	<cfset iPaddingLen = len(sPadding) + 1 + len(createUuid())>
	<cfloop condition="true">
		<cfset sThisPadding = sPadding & " " & createUuid()>
		<cfoutput>#sThisPadding#</cfoutput>
		<cfset iSize += iPaddingLen>
		<cfif iSize GT URL.size * 1024>
			<cfbreak>
		</cfif>
	</cfloop>
	<cfoutput>#URL.text#</cfoutput>
</cfdocument>