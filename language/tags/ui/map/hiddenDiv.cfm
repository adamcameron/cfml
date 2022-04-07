<script>
	function show(){
		o = document.getElementById("map");
		o.style.display = "block";
		return false;
	}
</script>

<div id="map" style="display:none">
	<cfmap	zoomlevel		= "12"
			name			= "mainMap"
			showcentermarker= "true"
			centeraddress	= "10 downing street london"
	/>
</div>
<a href="##" onclick="return show()">Click me</a>
