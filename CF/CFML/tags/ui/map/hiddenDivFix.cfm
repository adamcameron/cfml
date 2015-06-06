<script>
    function show(){
ColdFusion.Map.show('mainMap');
    }
</script>



<div id="map">
    <cfmap
            zoomlevel = "12"
            name = "mainMap"
            showcentermarker= "true"
            centeraddress = "10 downing street london"
            initShow=false
    />
</div>

<a href="##" onclick="show()">Click me</a>