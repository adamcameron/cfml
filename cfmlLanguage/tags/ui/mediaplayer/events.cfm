<script type="text/javascript">
	function onLoadHandler(){
		alert("loaded");
		return true;
	}
	function onStartHandler(){
		alert("started");
		return true;
	}
	function onCompleteHandler(){
		alert("completed");
		return true;
	}

</script>


<cfmediaplayer source="/shared/cf/cfml/M/mediaplayer/20051210-w50s.flv" onload="onLoadHandler" onstart="onStartHandler" oncomplete="onCompleteHandler">