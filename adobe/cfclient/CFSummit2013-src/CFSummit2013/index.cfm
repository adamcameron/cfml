<!--- 
	Uncomment following setting if you want to open tweets in a separate 
	window on mobile. Otherwise you don't need to enable device APIs for
	this application. Database access do not need device APIs enalbed.
	
	If you uncomment following line, then you may not be able to run this
	app in desktop browsers. - Ram
--->
<!---<cfclientsettings enableDeviceAPI=true >--->

<link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css"> </link>
<link rel="stylesheet/less" type="text/css" href="css/cfsummit.less"> </link>


<!---For smartphones (portrait and landscape) -------------->
<link rel="stylesheet/less" type="text/css" media="only handheld, screen 
	and (min-device-width:320px) and (max-device-width:480px)" href="css/cfsummit_320_480.less"></link>

<!---For ipads (portrait and landscape) -------------->
<link rel="stylesheet/less" type="text/css" media="only handheld, screen 
	and (min-device-width:768px) and (max-device-width:1024px)"  href="css/cfsummit_768_1024.less"></link>
	
<!---For desktops -------------->
<link rel="stylesheet/less" type="text/css" media="only handheld, screen 
	and (min-width:1224px)" href="css/cfsummit_desktop.less"></link>

<script src="js/jquery-2.0.3.min.js"></script>
<script src="bootstrap3/js/bootstrap.min.js"></script>

<!--- used for creating rating starts in the survey page --->
<script src="js/jquery.raty.min.js"></script>

<!--- for tweets page --->
<script src="tweet_utils/sha1.js"></script>
<script src="tweet_utils/codebird.js"></script>

<script src="js/less-1.4.1.min.js"></script>

<script src="js/path.js"></script>

<script src="js/utils.js"></script>
<script src="js/cfsummit.js"></script>
	
<cfclient>
	<cfinclude template="index_include.cfm" >
</cfclient>

<div class="main-container">
	<!--- Page topic/name is displayed in app_header div --->
	<div id="app_header"class="navbar navbar-fixed-top"></div>
	
	<!--- Main content of the page is displayed in main_div --->
	<div id="main_div" style="overflow:auto"></div>
	
	<!--- Banner at the bottom --->
	<div class="navbar navbar-fixed-bottom" id="title-bar" style="position:fixed;display:none">
		<!--- image without back and home buttons. Display this image in home page --->
		<img src="images/bottom_title1.jpeg" width="100%" id="title_img"></img>
		
		<!--- image with back and home buttons. Display this image on pages other than home  --->
		<img src="images/bottom_title2.jpeg" width="100%" id="title_img1" style="display:none"></img>
	</div>
</div>
