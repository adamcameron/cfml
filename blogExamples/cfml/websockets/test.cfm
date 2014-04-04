<script type="text/javascript">
	function mymessagehandler(messageObject){
		//JavaScript messageobject is converted to a string.
		var message = ColdFusion.JSON.encode(messageObject);
		var txt=document.getElementById("myDiv");
		txt.innerHTML +=message  +"<br>";
	}

</script>
<cfwebsocket name="mycfwebsocketobject" onmessage="mymessagehandler" subscribeto="chatChannel">
<cfdiv id="myDiv"></cfdiv>