<cfscript>
	param URL.lat="";
	param URL.long="";
	param URL.address="";

	if (len(URL.lat) && len(URL.long)){
		variables.strHandler = "latLngHandler";
	}else if (len(URL.address)){
		variables.strHandler = "addressHandler";
	}
</cfscript>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title></title>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<style>
	html, body, #js-mapGoesHere {
		margin	: 0;
		padding	: 0;
		height	: 100%;
	}
</style>
</head>
<body>

<div id="js-mapGoesHere">
</div>

<cfif structKeyExists(variables, "strHandler")>
	<cfoutput>
	<script>
	<cfif variables.strHandler EQ "addressHandler">
		addressHandler = function (){
			var oGeocoder = new google.maps.Geocoder();
			oGeocoder.geocode(
				{'address' : '#URL.address#'},
				function(results, status){
					var	oLatLng = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
					renderMap(oLatLng);
				}
			);	
		};
	</cfif>

	<cfif variables.strHandler EQ "latLngHandler">
		latLngHandler = function(){
			var	oLatLng = new google.maps.LatLng(#URL.lat#,#URL.long#);
			renderMap(oLatLng);
		}
	</cfif>

	google.maps.event.addDomListener(
		window,
		"load",
		#variables.strHandler#
	);

	renderMap = function(oLatLng){
		stuMapOptions	= {
			zoom		: 16,
			center		: oLatLng,
			mapTypeId	: google.maps.MapTypeId.ROADMAP
		},
		oMap			= new google.maps.Map(document.getElementById('js-mapGoesHere'), stuMapOptions),
		marker			= new google.maps.Marker({
			position	: oLatLng,
			map			: oMap
		});
	}

	</script>
	</cfoutput>
</cfif>
</body>
</html>
