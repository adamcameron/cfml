<!---
	Custom tag to display speaker information
	Attributes : 
		parent - Id of parent div 
		speaker - Speaker VO (speaker_vo.cfc)
--->
<cfclient>
	<cfif thisTag.executionMode eq "start">
		<cfset display_speaker_details()>
	</cfif>
	
	<cffunction name="display_speaker_details" >
		<cfset var speaker = attributes.speaker>
		
		<cfset document.location.hash="##">
		
		<cfset var parent_div = $("##"+attributes.parent)>
		
		<cfoutput>
			<cfsavecontent variable="tmphtml" >
			<div style="overflow:auto" id="speaker_dtls_div"> 
				<div class="speaker-snippet">
					<table>
						<tr>
							<td>
								<img class="speaker-img" src='images/speakers/#speaker.speaker_image#'></img>
							</td>
							<td class="speaker_name_td">
								<span class="speaker-name">
						    		#speaker.name#
						    	</span> <br>
						    	<span class="speaker-title">
						    		#speaker.speaker_title#
								</span><br>
						    	<span class="speaker-org">
						    		#speaker.speaker_org#
								</span>
							</td>
						</tr>
					</table>
			    </div>
			    <div class="schedule-item Timing"> Speaker Info </div>
			    <div class="session-info">#speaker.speaker_info#</div>
			    
				<cfset var speakerSessions = getSpeakerSessions(speaker.name)>
				<cfif speakerSessions.length gt 0>
					<div class="schedule-item Timing">
						Sessions
					</div>
					<div id="speaker_session">
						<ul>
						<cfloop array="speakerSessions" index="session">
							<li>
							#session.name# - 
							<cfif session.day eq "1">
								24th October 2013, 
							<cfelse>
								25th October 2013, 
							</cfif>
							#window.cfsummit_utils.format_time(session.start_time)#
							-
							#window.cfsummit_utils.format_time(session.end_time)#
							</li>
						</cfloop>
						</ul>
					</div>					
				</cfif>
			</div>
			</cfsavecontent>
		</cfoutput>	
		
		<cfset $(parent_div).append(tmphtml)>
		<cfset setTopDivMargin("speaker_dtls_div")>
	</cffunction>
	
	<cffunction name="getSpeakerSessions" >
		<cfargument name="speakerName" >
		
		<cfset var speakerSessions = []> 
		
		<cfloop array="#window.sessions#" index="session">
			<cfloop list="#session.speaker_name#" index="sessionSpeaker" >
				<cfif sessionSpeaker.trim() eq speakerName>
					<cfset speakerSessions.push(session)>
				</cfif>
			</cfloop>
		</cfloop>
		
		<cfreturn speakerSessions>
	</cffunction>

</cfclient>