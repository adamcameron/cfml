<script type="text/javascript">
	function testClick(){
		oText = document.getElementById("txt1");
		oText.value = "Clicked";
		return true;
	}
</script>
<cfform action="./testOnclick.cfm" format="html">
	<input type="text" name="txt1" id="txt1" value="DEFAULT" /><br />
	<cfbutton label="Click Me" onclick="testClick">
</cfform>
