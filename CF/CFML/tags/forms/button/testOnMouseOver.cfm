<script type="text/javascript">
	function testOnMouseOver(){
		oText = document.getElementById("txt1");
		oText.value = "Over";
		return true;
	}
</script>
<cfform action="./testMinimum.cfm" format="html">
	<input type="text" name="txt1" id="txt1" value="DEFAULT" /><br />
	<cfbutton label="Click Me" onmouseover="testOnMouseOver" tip="Here's a tip!">
</cfform>
