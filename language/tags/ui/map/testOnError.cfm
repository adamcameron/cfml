<script type="text/javascript">
	function onErrorHandler(statusCode, errorMessage){
		alert("Code: " + statusCode + "; Message: "+ errorMessage);
		return true;
		
	}
</script>

<cfmap centeraddress="##" name="rangitoto1" onerror="onErrorHandler" />