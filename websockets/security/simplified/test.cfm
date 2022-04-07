<script type="text/javascript"> 
       function msgHandler(msgobj){ 
           var txt = document.getElementById("telemetry"); 
           var message = ColdFusion.JSON.encode(msgobj); 
           txt.innerHTML += message + "<br >" + "<br>"; 
       } 
       function startPolling(){ 
			serverSocket.invoke("ServerTelemetry", "getStatus"); 
       } 
</script> 
<cfwebsocket name="serverSocket" onmessage="displayResponse"> 
<button onclick="startPolling()">Poll Server</button>
<div id="telemetry"></div> 
