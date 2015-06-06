<cfscript>
	sSrc	= "http://networks.uat.intranet.arup.com/networks/forum/forum_home.cfm";
	sMatch	= "(http://[^/]+)(/intranet)?(/networks)?/(bridgenet|mssn|acoustics|networks|forum|diary|)";
	sReplace= "/intranet/networks/\4";
	sResult	= reReplaceNoCase(sSrc, smatch, sReplace, "ALL");
</cfscript>
<cfdump var="#variables#">
<script type="text/javascript">
	var sSrc	= "http://networks.uat.intranet.arup.com/networks/forum/forum_home.cfm";
	var rMatch	= new RegExp("/(http://[^/]+)(/intranet)?(/networks)?/(bridgenet|mssn|acoustics|networks|forum|diary|)/", "gi");
	var rReplace= new RegExp("/intranet/networks/\4");
	var sResult	= sSrc.replace(rMatch, rReplace);
	alert(sResult);
</script>