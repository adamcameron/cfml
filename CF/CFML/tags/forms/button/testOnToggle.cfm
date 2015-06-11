<script type="text/javascript">
	function testOnToggle(button, pressed){
		oText = document.getElementById("txt1");
		oText.value = "Toggled: " + pressed;
		return true;
	}
</script>
<cfform action="./testOnToggle.cfm" format="html">
	<input type="text" name="txt1" id="txt1" value="DEFAULT" />
	<cfbutton label="Click Me" ontoggle="testOnToggle" toggle="true">
</cfform>
