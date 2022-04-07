<cfparam name="url.count" default="0" type="integer">
<cfset oThread = createObject("java", "java.lang.Thread")>
<cfflush interval="20">
<cfset sPath = getDirectoryFromPath(getCurrentTemplatePath())>
<cfloop index="i" from="1" to="#url.count#">
	<cfset sFileName = "file#timeFormat(now(), 'hhmmsslll')##getTickCount()#.dat">
	<cfset sFilePath = sPath & sFileName>
	<cfset sContent = sFilePath>
	<cfoutput>
	Writing: [#sFilePath#]...
	<cffile action="write" output="#sContent#" file="#sFilePath#">
	Written<br />
	<cfset oThread.sleep(10)>
	</cfoutput>
</cfloop>