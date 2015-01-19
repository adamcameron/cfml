<!---
	Custom tag to display sessions list. Called when 'Schedule' or 'My Schedule' option
	is selected on the main menu page.
	
	Attributes :
		parent - Id of parent div
		sessions - Array of sesison_vo(.cfc)
		active_day - "1" or "2" 
		mysession - Set true if 'My Schedule' menu option selected
		callback_func - Callback function to display details of selected session		 
				
--->

<cfclient>
	<cfif thisTag.executionMode eq "start">
		<cfif attributes.sessions neq "" and attributes.sessions.length gt 0>
			<cfset display_sessions()>
		</cfif>
	</cfif>
			
	<cffunction name="display_sessions" >
		
		<cfset var parent_div = $("##"+attributes.parent)>
		<cfset var active_day = attributes.active_day>
		
		<cfsavecontent variable="tmphtml" >
			<ul class="nav" id="daynav" >
  				<li class="active navli" id="day1li">
  					<a href="#day1" id="day1Btn" class="navBtn tab-btn" data-toggle="tab">Day 1</a>
  				</li>
  				<li class="navli" id="day2li">
  					<a href="#day2" id="day2Btn" class="navBtn" data-toggle="tab">Day 2</a>
  				</li>
			</ul>  		

			<div id="myTabContent" class="tab-content" >
				<div class="tab-pane active" id="day1">
			   	 	<div class="schedule-container" id="schedule-day1">
			 		</div>
  				</div>
 
 				<div class="tab-pane" id="day2">
	  				<div class="schedule-container" id="schedule-day2">
	   				</div>
				</div>	
  			</div>
		</cfsavecontent>
		
		<cfset $(parent_div).append(tmphtml)>
		
		<cfset var day1_list_obj = $("##schedule-day1")>
		<cfset var day2_list_obj = $("##schedule-day2")>
		
		<cfset appHeaderHeight = $("##app_header").height()>
		
		<cfset $("##daynav").offset({"top":appHeaderHeight,"left":0})>
		
		<cfset dayNavHeight = $("##daynav").height() + appHeaderHeight>
		<cfset $("##myTabContent").css("padding-top",dayNavHeight)>
		
		<cfset var sessions = attributes.sessions>
		
		<cfset var prev_time = "">
		<cfloop array="#sessions#" index="session">
			<cfif session.day eq "1">
				<cfset var list_obj = day1_list_obj>
			<cfelse>
				<cfset var list_obj = day2_list_obj>
			</cfif>
			
			<cfoutput >
				<cfif prev_time eq "" or prev_time neq session.start_time>
					<cfsavecontent variable="tmphtml" >
						<div class="schedule-item Timing"><i class="glyphicon glyphicon-time icon-time-padded"></i>
							#window.cfsummit_utils.format_time(session.start_time)#
						 	-
						 	#window.cfsummit_utils.format_time(session.end_time)#
						</div>
					</cfsavecontent>
					<cfset $(list_obj).append(tmphtml)>	
				</cfif>
				
				<cfsavecontent variable="tmphtml" >
					<cfif session.session_type eq "Other" or (session.session_type eq "Break")>
						<div class="schedule-item Break">
							<p>#session.name#</p>
							<p>
								<cfif session.room neq "">
									<span class="room_class">Location : #session.room#</span>
						 		</cfif>
					 		</p>
					 	</div>
					<cfelse>
						<a href="##" onclick="on_session_clicked('#session.id#')" >
							<div class="schedule-item General">
								<div style="width:75%; display: inline-block;">
									<p class="session-name">
										<span>#session.name#</span>
									</p>
									<p>
										<cfif session.room neq "">
											<span class="room_class">Location : #session.room#</span>
										</cfif>
										
										<cfif session.session_type eq "Session" and attributes.mysession eq false>
											<button class="btn btn-default session_add_btn" id="addRemBtn">
												<cfif session.my_session>
													Remove
												<cfelse>
													Add
												</cfif>
											</button>
										</cfif>
								    </p>
								    <p class="session-speakername">#session.speaker_name#</p>
								</div>
							    <span class="glyphicon glyphicon-chevron-right icon-chevron"></span>
							</div>
						</a>
					</cfif>
				</cfsavecontent>
			</cfoutput>
			
			<cfset prev_time = session.start_time>
								
			<cfset var link_obj = $(tmphtml).appendTo(list_obj)>
			
			<cfset var btns =  $(link_obj).find("button.session_add_btn")>
			<cfset $(btns).click(on_add_remove_btn_session_list)>
			<cfset $(btns).data("session",session)>
			<cfset $(link_obj).data("session",session)>
			<cfset $(link_obj).addClass(create_css_class_name(session))>
			
			<cfif session.session_type eq "Session">
				<cfset var session_class = "mys" + session.my_session> 
				<cfset $(link_obj).addClass(session_class)>
			</cfif>
		</cfloop>

		<cfif isDefined("attributes.active_day") and  attributes.active_day eq "2">
			<cfset show_day2()>
		<cfelse>
			<cfset show_day1()>
		</cfif>
		
		<cfset $("##day1Btn").click(onDay1Clicked)>
		<cfset $("##day2Btn").click(onDay2Clicked)>
		
		<cfif attributes.mysession eq true>
			<cfset $(".mys0").hide()>
		</cfif>
		
		<cfset $("#main_div#").scrollTop(window.session_scroll_pos)>
		<cfset window.session_scroll_pos = 0>

	</cffunction>
	
	<cffunction name="create_css_class_name" >
		<cfargument name="session" >
		
		<cfset var strt_str = reReplace(session.start_time.toString(),":","","ALL")>
		<cfset var end_str = reReplace(session.end_time.toString(),":","","ALL")>
		<cfset var css_cls = "session_" + session.day + "_" + strt_str + end_str> 	
		<cfreturn css_cls>
	</cffunction>
	
	<cffunction name="on_add_remove_btn_session_list" >
		<cfargument name="event" >
		
		<cfset var session = $(event.target).data("session")>
		<cfset var add_sessios = session.my_session eq 0 ? true : false>
		<cfif IsDefined("session")>
			<cfset invokeCFClientFunction("window._g_db_manager.setMySession", on_mark_session_result,session,add_sessios)>			
		</cfif>
		<cfreturn false>
	</cffunction>
	
	
	
	<cffunction name="on_session_clicked" >
		<cfargument name="id" >
	    
		<cfset var selected_session = this.getSessionForSessionList(id)>
		<cfif selected_session eq "">
			<cfreturn >
		</cfif>
		<cfset window.session_scroll_pos = $("#main_div#").scrollTop()>
		<cfset eval(attributes.callback_func + "(selected_session,attributes.mysession)")>
		
		<cfreturn false>
	</cffunction>
	
	<cffunction name="getSessionForSessionList" >
		<cfargument name="id" >
		
		<cfset var sessions = attributes.sessions>
		
		<cfloop array="#sessions#" index="session">
			<cfif session.id eq id>
				<cfreturn session>
			</cfif>
		</cfloop>
		
		<cfreturn "">
		
	</cffunction>
	
	<cffunction name="show_day1" >
		<cfset $("##daynav a##day1Btn").tab("show")>
		<cfset window.activeDay = "1">
		<cfset onDay1Clicked()>
	</cffunction>

	<cffunction name="show_day2" >
		<cfset $("##daynav a##day2Btn").tab("show")>
		<cfset window.activeDay = "2">
		<cfset onDay2Clicked()>
	</cffunction> 
	
	<cffunction name="onDay1Clicked" >
		<cfset $("##day1Btn").addClass("dayActive")>
		<cfset $("##day2Btn").removeClass("dayActive")>
		<cfset window.activeDay = "1">
	</cffunction>
	
	<cffunction name="onDay2Clicked" >
		<cfset $("##day2Btn").addClass("dayActive")>
		<cfset $("##day1Btn").removeClass("dayActive")>
		<cfset window.activeDay = "2">
	</cffunction>
	
	<!--- Callback function. Called when session is added/removed from schedule --->
	<cffunction name="on_mark_session_result" >
		<cfargument name="session" >
		
		<cfset var cls_name = create_css_class_name(session)>
		
		<cfset var elms = $("."+cls_name)>
		<cfloop array="#elms#" index="elm">
			<cfset var btns = $(elm).find(".session_add_btn")>
			<cfif btns.length gt 0>
				<cfset var tmp_session = $(elm).data("session")>
				<cfif tmp_session.id eq session.id>
					<cfif session.my_session eq 0>
						<cfset $(elm).find(".session_add_btn").text("Add")>
					<cfelse>
						<cfset $(elm).find(".session_add_btn").text("Remove")>
					</cfif>
					<cfset tmp_session.my_session = session.my_session>
				<cfelse>
					<cfset $(elm).find(".session_add_btn").text("Add")>
					<cfset tmp_session.my_session = 0>
				</cfif>
			</cfif>
		</cfloop> 
		
	</cffunction>

</cfclient>
