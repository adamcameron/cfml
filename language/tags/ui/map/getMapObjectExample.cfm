<html>
<head>
<script> 
function getMapObject() 
{ 
var mapObj = ColdFusion.Map.getMapObject('mapID'); 
//mapObj.setCenter(new GLatLng(37.4419, -122.1419), 13);
mapObj.disableDragging(); 
} 
</script> 
</head>
<body onload="getMapObject()">
<h3>This is an example of the Map.getmapObject function. Click the HTML button labeled "GetMap" to get the map object and set the center to Palo Alto.</h3> 
<h3>MAP 1</h3> 
<form name="map01"> 
<input type="button" value="getMapObject and setCenter" name="htmlbutton" onclick="javascript:getMapObject()"> 
</form> 
<cfmap name="mapID" 
	centerAddress='201 S. Division St. Suite 500 Ann Arbor, MI 48104' 
	doubleclickzoom="true" 
	overview=true 
	scrollwheelzoom=true 
	zoomlevel="4"
> 
</cfmap>
</body>
</html>