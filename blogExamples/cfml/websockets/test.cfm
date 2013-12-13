<script type="text/javascript">
<<<<<<< HEAD
	/* mymessangehandler function receives all messages that comes via WebSocket. This function requires one argument. */

	function mymessagehandler(messageObject){
		//JavaScript messageobject is converted to a string.
		var message = ColdFusion.JSON.encode(messageObject);
		var txt=document.getElementById("myDiv");
		txt.innerHTML +=message  +"<br>";
	}
=======
 /* mymessangehandler function receives all messages that comes via WebSocket. This function requires one argument. */

 function mymessagehandler(messageObject){
  //JavaScript messageobject is converted to a string.
  var message = ColdFusion.JSON.encode(messageObject);
  var txt=document.getElementById("myDiv");
  txt.innerHTML +=message  +"<br>";
 }
>>>>>>> df0c64506eb5f9981d72192e5f84fda45f1aeb68
</script>
<cfwebsocket name="mycfwebsocketobject" onmessage="mymessagehandler" subscribeto="chatChannel">
<cfdiv id="myDiv"></cfdiv>