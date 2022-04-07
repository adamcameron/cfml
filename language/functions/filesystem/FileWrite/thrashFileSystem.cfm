<cfparam name="URL.files" default="10" type="integer">
<cfparam name="URL.size" default="32" type="integer"><!--- in kB --->
<cfparam name="URL.delete" default="true" type="boolean">

<cfset iAllStart = getTickCount()>
<cfset sBaseDir	= expandPath("./")>

<cfflush interval="128">
<cfoutput>
	<div style="font-size:x-small;">
	<cfloop index="i" from="1" to="#URL.files#">
		<cfset sFileName = createUuid() & ".dat">
		<cfset sFilePath = sBaseDir & sFileName>
		<cftry>
			<span style="color:blue;">#i#/#URL.files# Opening #sFilePath# for write&hellip;</span><br />
			<cfset f = fileOpen(sFilePath, "write", "UTF-8")>
			<span style="color:green;">Opened #sFilePath# for write</span><br />

			<span style="color:blue;">Writing to file&hellip;</span><br />
			<cfloop index="j" from="1" to="#URL.size#">
				<cfset sKb = "">
				<cfloop index="k" from="1" to="1024">
					<cfset sKb = sKb & chr(randRange(65,90))>
				</cfloop>
				<cftry>
					<cfset fileWrite(f, sKb)>
					<cfcatch>
						<span style="color:orange;">Error writing to file #sFilePath#: #cfcatch.message# #cfcatch.detail#</span><br />
					</cfcatch>
				</cftry>
			</cfloop>
			<span style="color:green;">Written to file</span><br />

			<cftry>

				<span style="color:blue;">Closing #sFilePath#&hellip;</span><br />
				<cfset fileClose(f)>
				<span style="color:green;">Closed #sFilePath#</span><br />

				<cfif URL.delete>
					<cftry>

						<span style="color:blue;">Deleting #sFilePath#&hellip;</span><br />
	 					<cfset fileDelete(sFilePath)>
						<span style="color:green;">Deleted #sFilePath#</span><br />

						<cfcatch>
							<span style="color:orange;">Error deleting #sFilePath#: #cfcatch.message# #cfcatch.detail#</span><br />
						</cfcatch>
					</cftry>
				</cfif>

				<cfcatch>
					<span style="color:orange;">Error closing #sFilePath#: #cfcatch.message# #cfcatch.detail#</span><br />
				</cfcatch>
			</cftry>

			<cfcatch>
				<span style="color:red;">Error opening #sFilePath# for write: #cfcatch.message# #cfcatch.detail#</span><br />
			</cfcatch>
		</cftry>
	</cfloop>
	<span style="color:green;">Process completed in [#getTickCount()-iAllStart#ms]</span><br />
	</div>
</cfoutput>
