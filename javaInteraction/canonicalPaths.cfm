<!--- canonicalPaths.cfm --->
<cfset actualPath = "C:\webroots\shared\git\blogExamples\coldfusion\sandbox">
<cfset linkedPath = "C:\apps\adobe\ColdFusion\10\cfusion\wwwroot\shared\git\blogExamples\coldfusion\sandbox">

<cfoutput>
Actual: #actualPath# => #createObject("java", "java.io.File").init(actualPath).getAbsolutePath()#<br>
Linked: #linkedPath# => #createObject("java", "java.io.File").init(linkedPath).getAbsolutePath()#<br>
</cfoutput>
