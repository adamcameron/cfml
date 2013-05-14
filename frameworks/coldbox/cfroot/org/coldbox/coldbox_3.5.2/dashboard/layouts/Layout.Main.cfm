<cfsetting showdebugoutput="false">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<meta name="keywords" lang="en" content="software,coldfusion,cfmx,cfc,java,spring,hibernate,open source,coldbox,adobe,railo,bluedragon,new atlanta,mac os, apple,ipod,amazon,games,blog,forums,ortus solutions,ortus,mac">
	<meta name="description" lang="en" content="This is an open source software for the ColdBox Framework.">
	<title>ColdBox Dashboard powered by the ColdBox Framework.</title>
	<link href="includes/styles/style.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="includes/javascript/dashboard.js"></script>
	<script language="javascript" src="includes/javascript/jquery-latest.pack.js"></script>
	<script language="javascript" src="includes/javascript/plugins/jqModal.js"></script>
	<script language="javascript" src="includes/javascript/plugins/jqDnR.js"></script>
	<script language="javascript" src="includes/javascript/plugins/jquery.block.js"></script>
</head>
<body>
	
<cfoutput>
<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0" summary="software,coldfusion,cfmx,cfc,java,spring,hibernate,open source,coldbox,adobe,railo,bluedragon,new atlanta,mac os, apple,ipod,amazon,games,blog,forums,ortus solutions,ortus,mac">
	<tr>
		<td valign="top" height="900" align="center">
		<!--- S:ADS --->
		<!--- <div align="center">
		<script type="text/javascript"><!--
		google_ad_client = "pub-0884459722343463";
		google_ad_width = 468;
		google_ad_height = 60;
		google_ad_format = "468x60_as";
		google_ad_type = "text_image";
		//2007-06-23: dashboard
		google_ad_channel = "3814130061";
		google_color_border = "FFD21D";
		google_color_bg = "FDFDFD";
		google_color_link = "000000";
		google_color_text = "000000";
		google_color_url = "CC6600";
		//-->
		</script>
		<script type="text/javascript"
		  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>
		</div> --->
		<!--- E:ADS --->
		
		<!--- Content --->
		<div id="content"></div>
		</td>
		
		<td class="sidemenu" valign="top">
		#renderView()#
		<!--- Render sidemenu tools --->
		#renderview("tags/sidemenu_tools")#
		</td>
	</tr>
</table>
</cfoutput>

</body>
</html>