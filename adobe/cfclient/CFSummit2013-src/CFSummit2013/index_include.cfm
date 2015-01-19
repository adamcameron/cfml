<!---
	This include file is created to move all cfclient specific code 
	from index.cfm - Ram
--->
<cfclient>
	
	<cfset $(document).ready(on_ready)>
	
	<!--- on JQuery ready --->
	<cffunction name="on_ready" >
		<cfset setupPaths()> <!--- in cfsummit.js--->
		
		<!--- initialize a few global variables --->
		<cfset window.ds_name = "cfsummit"> <!--- Data source name --->
		<cfset window.activeDay = "1">
		<cfset window.session_scroll_pos = 0>
		<cfset window.speaker_scroll_pos = 0>
		<cfset window._g_db_initialized = false>
		
		<!--- Setup image map for back and home button in the bottom banner image ---> 
		<cf_image_map image_id="title_img1"
				image_areas= #titleImageAreas# <!--- images areas defined in cfsummit.js --->
				image_width=640 <!--- original width of the image --->
				image_height=110 > <!--- Original height of the image --->
				
		<cfset displayStartPage()> <!--- in cfsummit.js --->

	</cffunction>
	
	<cffunction name="show_sessions" >
		<cfargument name="day" default="1">
		
		<cfset clear_main_div()>
		
		<cf_session_list parent="main_div"
			sessions="#window.sessions#"
			active_day="#day#"
			mysession=false
			callback_func="on_show_session_details">	
	</cffunction>
	
	<cffunction name="clear_main_div" >
		<cfset $("##main_div").text("")>
	</cffunction>
	
	<cffunction name="setMainDivHeight" >
		<cfscript>
			
			$("##main_div").css("height","100%");
			var mainHeight = $("##main_div").height();

			var titleHeight = 0;
			var appHeaderHeight = getAppHeaderHeight();
			if ($("##title-bar:visible").length > 0)
				titleHeight = $("##title-bar").height();
			
			mainHeight = mainHeight - titleHeight -appHeaderHeight;
			$("##main_div").css("height",mainHeight);
			$("##main_div").css("top",appHeaderHeight);
		</cfscript>
	</cffunction>
	
	<cffunction name="getAppHeaderHeight" >
		<cfscript>
			var appHeaderHeight = 0;
			if ($("##app_header:visible").length > 0)
				appHeaderHeight = $("##app_header").height();
			return appHeaderHeight;
		</cfscript>
	</cffunction>
	
	<cffunction name="setTopDivMargin" >
		<cfargument name="divId" >
			<cfset var table_obj = $("##"+divId).css("margin-top",getAppHeaderHeight()+10)>
	</cffunction>
	
	<cffunction name="on_show_session_details">
		<cfargument name="selected_session" >
		<cfargument name="my_schedule" default="false">
		
		<cfif my_schedule eq true>
			<cfset var callback_func = "show_my_schedule">
		<cfelse> 
			<cfset var callback_func = "show_sessions">
		</cfif>
		
		<cfset clear_main_div()>
		
		<cf_session_details parent="main_div"
			session="#selected_session#">
	</cffunction>
	
	<cffunction name="show_main_menu" >
		<cfset clear_main_div()>
		<cf_home parent="main_div" >	
	</cffunction>
	
	<cffunction name="show_speakers" >
		
		<cfset clear_main_div()>
		
		 <cf_speaker_list parent="main_div"
		    speakers = "#window.speakers#"
			callback_func="on_show_speaker_details">	
						
	</cffunction>
	
	<cffunction name="on_show_speaker_details" >
		<cfargument name="selected_speaker" >
		
		<cfset clear_main_div()>
		<cf_speaker_details parent="main_div"
			speaker="#selected_speaker#"
			callback_func="show_speakers">
	</cffunction>	
	
	
	<cffunction name="show_tweets" >
		<cfset clear_main_div()>
		<cf_tweet_list parent="main_div">
	</cffunction>
	
	<cffunction name="show_my_schedule" >
		<cfargument name="day" default="1">
		
		<cfset clear_main_div()>
		<cf_session_list parent="main_div"
			sessions="#window.sessions#"
			active_day="#day#"
			mysession=true
			callback_func="on_show_session_details">	
	</cffunction>
	
	<cffunction name="show_notifications" >
		<cfset clear_main_div()>
		<cf_notifications parent="main_div">		
	</cffunction>
	
	<cffunction name="showSplash" >
		<cfset clear_main_div()>
		<cf_splash	parent="main_div">
	</cffunction>
	
	<cffunction name="showSurvey" >
		<cfset clear_main_div()>
		<cf_survey parent="main_div">
	</cffunction>	
	
</cfclient>