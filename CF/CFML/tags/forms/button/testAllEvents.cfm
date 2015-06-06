<script type="text/javascript">
	function testOnClick(){
		oText = document.getElementById("txt1");
		oText.value = "Clicked";
		return true;
	}

	function testOnMouseOver(){
		oText = document.getElementById("txt1");
		oText.value = "Over";
		return true;
	}
	
	function testOnMouseOut(){
		oText = document.getElementById("txt1");
		oText.value = "Outed";
		return true;
	}

	function testOnToggle(button, pressed){
		oText = document.getElementById("txt2");
		oText.value = "Toggled: " + pressed;
		button.label = "State: " + pressed;
		return true;
	}
		
</script>
<cfform action="./testMinimum.cfm" format="html">
	<input type="text" name="txt1" id="txt1" value="DEFAULT" /><br />
	<input type="text" name="txt2" id="txt2" value="DEFAULT" /><br />
	<cfbutton label="Click Me" onclick="testOnClick" onmouseover="testOnMouseOver" onmouseout="testOnMouseOut" ontoggle="testOnToggle" toggle="true" name="btn1">
</cfform>
