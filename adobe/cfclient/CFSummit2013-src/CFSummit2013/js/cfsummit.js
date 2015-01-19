//Global JS functions

function setupPaths()
{
	Path.map("#/schedule").to( function()
	{
		onMenuPage(false,"Schedule");
	 	show_sessions(window.activeDay);
	});
		
	Path.map("#/CFSummit").to( function()
	{
		onMenuPage(false,"Tweets");
		show_tweets();
	});
		 	
	Path.map("#/myschedule").to( function()
	{
		onMenuPage(false,"My Schedule");
		show_my_schedule(window.activeDay);
	});
		 	
	Path.map("#/speakers").to( function()
	{
		onMenuPage(false,"Presenters");
		show_speakers();
	});
	
	Path.map("#/home").to( function()
	{
		//onMenuPage(true,"");
		show_main_menu();
	});
	
	Path.map("#/sessiondetails").to( function()
	{
		
	});
	
	Path.map("#day1").to( function ()
	{
		internalHash();
	});
	
	Path.map("#/notifications").to( function()
	{
		onMenuPage(false,"Notifications");
		show_notifications();
	});
	
/*	Path.map("#/splash").to(function(){
 		$("#title_img").hide();
 		$("#title_img1").hide();
		showSplash();
	});
*/
	Path.map("#/survey").to( function()
	{
	 	onMenuPage(false,"Session Survey");
		showSurvey();
	});
		 			 	
	$(".home-icon").click(function(){
		document.location.hash = "#/home";	 		
	});
		
			 	
	Path.listen();
}

function onMenuPage(menuPage, header)
{
	if (menuPage)
	{
 		$("#title_img").show();
 		$("#title_img1").hide();
 		$("#app_header").hide();
 	}
 	else
 	{
 		$("#title_img").hide();
 		$("#title_img1").show().trigger("resize");
 		$("#app_header").show();
		$("#app_header").html(header);
	}
}
	 	
function displayStartPage()
{
 	document.location.hash = "#/home";			
}


//Following code should have gone in home.cfm, but because of a bug in 
//packaging app, I had to move it to this JS file. - Ram
imageWidth = 652;
imageHeight = 960;
menuImageAreas = [
	{
		left:0,	top:0, right:443, bottom:276, url:"#/schedule"		
	},
	{
		left:454, top:0, right:647, bottom:276, url:"#/speakers"		
	},
	{
		left:0,	top:289, right:327, bottom:565, url:"#/myschedule"		
	},
	{
		left:345, top:289, right:647, bottom:565, url:"#/notifications"		
	},
	{
		left:0,	top:569, right:444, bottom:839, url:"#/survey"		
	},
	{
		left:452, top:569, right:647, bottom:839, url:"#/CFSummit"		
	}		
];

titleImageWidth = 640;
titleImageWidth = 110;
titleImageAreas = [
	{
		left:6,	top:27, right:64, bottom:81, url:"back", callback:"onClickGoBack"	
	},
	{
		left:570, top:28, right:628, bottom:82, url:"home", callback:"onClickHome"		
	}
];
		
function onClickGoBack(url)
{
	history.go(-1);
	return false;
}

function onClickHome(url)
{
 	document.location.hash = "#/home";	 		
}
