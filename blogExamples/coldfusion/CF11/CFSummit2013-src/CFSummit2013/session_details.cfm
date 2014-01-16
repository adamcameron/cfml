<!---
	Custom tag to display home page.
	Attributes :
		parent - Id of parent div 
		session - Session Value Object (session_vo.cfc)
--->

<cfclient>
	<cfif thisTag.executionMode eq "start">
		<cfset display_session_details()>
	</cfif>
	
	<cffunction name="display_session_details" >
		
		<cfset var session = attributes.session>
		<cfset var parent_div = $("##"+attributes.parent)>
		<cfoutput>
			<cfsavecontent variable="tmphtml" >
				<div id="session_details">
					<div class="session-info-snippet">
						<p class="session-info-sessionname">			
							<span>#session.name#</span>					
						</p>
						<p class="session-info-details">
							<cfif session.day eq "1">
								24th October 2013
							<cfelse>
								25th October 2013
							</cfif>
						</p>
						<p class="session-info-details">
							#window.cfsummit_utils.format_time(session.start_time)#
							-
							#window.cfsummit_utils.format_time(session.end_time)#
						</p>
						<span class="room_class">
							#session.room#
						</span>
					</div>
					<div class="schedule-item Timing">Session Information</div>
						<p class="session-info">
							#session.session_info#
				        </p>
				    <div class="schedule-item Timing">Presenters</div>	
				    
			    	<cfif session.speaker_name neq "">
				    	<cfloop list="#session.speaker_name#" index="speaker_name">
						    <p class="speaker-info">
						    	<img src="images/speakers/#getSpeakerImagePath(trim(speaker_name))#"></img>
								<span style="vertical-align:top">#speaker_name#</span>
					        </p>
				    	</cfloop>
					</cfif>
				</div>
			</cfsavecontent>
		</cfoutput>
		
		<cfset $(parent_div).append(tmphtml)>
		
		<cfset setTopDivMargin("session_details")> <!--- in index_include.cfm --->
		
	</cffunction>
	
	<cffunction name="getSpeakerImagePath" >
		<cfargument name="speakerName" >
		
		<cfloop array="#window.speakers#" index="speaker">
			<cfif speaker.name eq speakerName>
				<cfreturn speaker.speaker_image>
			</cfif>
		</cfloop>
		<cfreturn "">
	</cffunction>
	
</cfclient>