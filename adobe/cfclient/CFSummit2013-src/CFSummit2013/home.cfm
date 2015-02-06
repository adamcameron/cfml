<!---
	Custom tag to display home page.
	Attributes :
		parent - Id of parent div 
--->
<cfclient>
	<cfif thisTag.executionMode eq "start">
		<cfset var parent_div = $("##"+attributes.parent)>
		
		<cfif not isDefined("window.g_splash_displayed") or window.g_splash_displayed eq false>
			<cfset window.g_splash_displayed = true>
			
			<!--- display splash the first time --->		
			<cfset $("##title-bar").hide()>
			<cfset setMainDivHeight()> <!--- in index_include.cfm --->
			
			<cfset var parent_div = $("##"+attributes.parent)>
			<cfsavecontent variable="tmphtml" >
				<img src="images/splash.jpg" width="100%" height="100%">
			</cfsavecontent>		
			
			<cfset $(parent_div).append(tmphtml)>

			<!--- display splash image for 1 sec --->
			<cfset setTimeout(display_home_page,1000)>
		<cfelse>
			<cfset display_home_page()>
		</cfif>
		
	</cfif>
	
	<cffunction name="display_home_page" >
		<cfset var parent_div = $("##main_div")>
		
		<!--- Because of a bug in custom tag I had to move cfsavecontent up and then assign it to a 
			variable. Otherwise image tag was getting appended to __cfclient_0 div instead
			of main_div - Ram --->
		<cfsavecontent variable="tmphtml" >
			<img src="images/menu_img.jpg" id="menu_img" width="100%" height="100%" ></img>
		</cfsavecontent>
		<cfset imageElm = tmphtml> <!--- work around for a bug mentioned above --->
		
		<cfset initDB()>
		<cfset $(parent_div).html("")>
		<cfset $("##title-bar").css("display", "block")>
		<cfset onMenuPage(true,"")>
		<cfset $(imageElm).appendTo(parent_div)>	
		
		<cfset initMenuImange()>
	</cffunction>
      
	<cfscript>
		// Initialize browser database for CFSummit app.
		function initDB()
		{
			//BUG: testing for true condition and returning from there
			//does not generate return statement. So execution falls through.- Ram
			if (window._g_db_initialized == false)
			{
				//All database code is accessed through db_manager
				window._g_db_manager = new cfcs.db_manager();
				window._g_db_manager.init_dbs();
				
				//Get all sessions and speakers and cache them in window 
				window.sessions = window._g_db_manager.getSessions();
				window.speakers = window._g_db_manager.get_speakers();
				
				//Create CFC for getting tweets
				window.tweet_util = new tweet_utils.TweetSearchUtils();
				
				window._g_db_initialized = true;
				window._g_lastWindowWidth = 0;
				window._g_lastWindowHeight = 0;
				
				//Check for session updates from the server
				window._g_db_manager.syncDataFromServer();
			}
		}
		
		//Set size of menu image and register event handlers			
		function initMenuImange()
		{
			var windowWidth = window.innerWidth;
			var windowHeight = window.innerHeight;
			var fixedTitleBar = true;
			
			window._g_lastWindowWidth = windowWidth;
			window._g_lastWindowHeight = windowHeight;
			
			$("##title-bar").width(windowWidth);
			var titleHeight = $("##title-bar").height();
			
			setMainDivHeight();
			
			if (!fixedTitleBar)
			{
				if ($("##title-bar").hasClass("navbar-fixed-bottom"))
				{
					$("##title-bar").removeClass("navbar-fixed-bottom");
				}
			}
			else
			{
				if ($("##title-bar").hasClass("navbar-fixed-bottom"))
				{
					$("##title-bar").addClass("navbar-fixed-bottom");
				}
			}

			if ($("##menu_img").length > 0)
			{
				$("##menu_img").width(windowWidth);
				$("##menu_img").height(windowHeight-titleHeight);

				var newWidth = $("##menu_img").width();
				var newHeight = $("##menu_img").height();
				
				xRatio = imageWidth / newWidth;
				yRatio = imageHeight / newHeight;
				
				$("##menu_img").unbind("click").unbind("mousemove").unbind("mouseout");
				
				$("##menu_img").click(onMenuImageClick);
				$("##menu_img").mousemove(onMenuImageMouseMove);
				$("##menu_img").mouseout(onMenuImageMouseOut);
			}
		}
		
		function onMenuImageMouseMove(e)
		{
			var url = getMenuClickArea(e.offsetX, e.offsetY);
			if (url != "")
			{
				$("##menu_img").css("cursor","pointer");
			} else
			{
				$("##menu_img").css("cursor","default");
			}
		}	
		
		function onMenuImageMouseOut(e)
		{
			$("##menu_img").css("cursor","default");
		}	
		
		function onMenuImageClick(e)
		{
			var url = getMenuClickArea(e.offsetX, e.offsetY);
			if (url != "")
			{
				document.location.href = url;
			}
		}
		
		function getMenuClickArea (x, y)
		{
			var realX = x * xRatio;
			var realY = y * yRatio;
			
			var i = 1;
			var url = "";
			for (;i <= menuImageAreas.length; i++)
			{
				var area = menuImageAreas[i];
				if (realX >= area.left && realX <= area.right &&
					realY >= area.top && realY <= area.bottom)
				{
					//found the area
					url = area.url;
					break;
				}
			}
			return url;			
		}
		
		window.removeEventListener("resize", onWindowResize);
 		window.addEventListener('resize', onWindowResize);
 		
 		function onWindowResize(event)
 		{
 			initMenuImange();
 		}
	</cfscript>
            	      	
</cfclient>