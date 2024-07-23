<script language="JavaScript" type="text/javascript">  
	function onToggleHandler(button, pressed){
		button.value = "Toggle state: " + pressed;
		alert(button.value);
	}  
</script>

<cfbutton name="mybutton" label="Toggle state: DEFAULT" toggle="true" ontoggle="onToggleHandler">  
