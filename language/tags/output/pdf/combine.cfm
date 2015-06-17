<cfset aNumbers = listToArray("one,two,three,four,five,six,seven,eight,nine,ten")>
<cfset sDir = expandPath("./combine/")>

<cfloop index="i" from="1" to="#arrayLen(aNumbers)#">
	<cfset sNum = aNumbers[i]>
	<cfdocument format="pdf" filename="#sDir##i#.pdf" overwrite="true">
		<cfoutput>#sNum#</cfoutput>
	</cfdocument>
</cfloop>

<cfpdf
	action		= "merge"
	directory	= "#sDir#"
	destination	= "#expandPath('./combine.pdf')#"
	overwrite	= "true"
>
