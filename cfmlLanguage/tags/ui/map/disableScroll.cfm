<cfscript>
	stMapAttributes = {
		name			= "myMap",
		centeraddress	= "auckland, new zealand",
		width			= 400,
		height			= 400,
		zoomLevel		= 10,
		type			= "map",
		scrollwheelzoom	= false,
		showCenterMarker= false,
		overview		= false		
	};
</cfscript>

<html>
<head>
<script>
	function disableDrag() {
		var map = ColdFusion.Map.getMapObject("myMap");       
		// disable map dragging
		map.disableDragging();


		alert("dunit");
	}


</script>
</head>
<body>
<cfmap attributecollection="#stMapAttributes#"></cfmap>
<cfset ajaxOnLoad("disableDrag")>
<a href="##" onclick="javascript:disableDrag()">disable</a>
</body>
</html>