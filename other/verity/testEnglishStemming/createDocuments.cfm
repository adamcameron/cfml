<cfflush interval="50">
<cfset sBaseDir = expandPath("./docs/")>
<cfsavecontent variable="lWordSets">
drink drank drunk,
woman women,
swim swam swum,
big bigger biggest
</cfsavecontent>
<cfsetting enablecfoutputonly="true">

<cfloop index="lSet" list="#lWordSets#">
	<cfset lSet = trim(lSet)>
	<cfset sSetRoot = listFirst(lSet, " ")>
	<!--- make a subdir --->
	<cfset sSubDir = sBaseDir & sSetRoot & "/">
	<cfoutput>Creating [#sSubDir#]<br /></cfoutput>
	<cfif not directoryExists(sSubDir)>
		<cfset directoryCreate(sSubDir)>
	</cfif>

	<!--- write doc with all --->
	<cfoutput>Creating PDF with wordset [#lSet#]&hellip;</cfoutput>
	<cfdocument format="PDF" filename="#sSubDir#all.pdf" overwrite="true">
		<cfoutput>#lSet#</cfoutput>
	</cfdocument>
	<cfoutput>created<br /></cfoutput>
		
	<!--- write doc with each --->
	<cfloop index="sWord" list="#lSet#" delimiters=" ">
		<cfoutput>Creating PDF with word [#sWord#]&hellip;</cfoutput>
		<cfdocument format="PDF" filename="#sSubDir##sWord#.pdf" overwrite="true">
			<cfoutput>#sWord#</cfoutput>
		</cfdocument>
		<cfoutput>created<br /></cfoutput>
	</cfloop>
</cfloop>