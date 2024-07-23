<cfflush interval="20">
Generate
<cf_timeit>
<cfset i = 12>
<cfsavecontent variable="s"><?xml version="1.0" encoding="utf-8"?>
	<aaa id="1">
		<cfloop index="b" from="1" to="#i#">
			<bbb id="1_#b#">
				<cfloop index="c" from="1" to="#i#">
					<ccc id="1_#b#_#c#">
						<cfloop index="d" from="1" to="#i#">
							<ddd id="1_#b#_#c#_#d#">
								<cfloop index="e" from="1" to="#i#">
									<eee id="1_#b#_#c#_#d#_#e#">
										<cfloop index="f" from="1" to="#i#">
											<fff id="1_#b#_#c#_#d#_#e#_#f#">
												ggg
											</fff>
										</cfloop>
									</eee>
								</cfloop>
							</ddd>
						</cfloop>
					</ccc>
				</cfloop>
			</bbb>
		</cfloop>
	</aaa>
</cfsavecontent>
</cf_timeit>

Write
<cf_timeit>
<cffile action="write" file="#getDirectoryFromPath(getCurrentTemplatePath())#big.xml" output="#s#">
</cf_timeit>

Read
<cf_timeit>
<cffile action="read" file="#getDirectoryFromPath(getCurrentTemplatePath())#big.xml" variable="sX">
</cf_timeit>

Parse
<cf_timeit>
<cfset x = xmlParse(sX)>
</cf_timeit>
