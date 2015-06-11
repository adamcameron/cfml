<script type="text/javascript">
	function testOnMouseOut(){
		oText = document.getElementById("txt1");
		oText.value = "Outed";
		return true;
	}
</script>
<cfform action="./testMinimum.cfm" format="html">
	<input type="text" name="txt1" id="txt1" value="DEFAULT" /><br />
	<cfbutton label="Click Me" onmouseout="testOnMouseOut">
</cfform>
