<script type="text/javascript">
	function onClickHandler(){
		alert("We're off!");
		ColdFusion.ProgressBar.start('pb1');
		return true;
	}
	
	function onCompleteHandler(){
		alert("Completed!");
		return true;
	}
</script>

<cfprogressbar name="pb1" duration="5000" interval="500" oncomplete="onCompleteHandler" />

<input type="button" name="btn1" id="btn1" value="Go!" onclick="onClickHandler()" />
