$(document).ready(function(){
	var allCookies = document.cookie;
	if (allCookies.indexOf("firefoxWarningShown") != -1){
		return;
	}

	var FF = !(window.mozInnerScreenX == null);
	if(!FF){
		return;
	}
	document.cookie = "firefoxWarningShown=true;;path=/;max-age=" + (60*60*24*365);
	$('#ffWarning').jqm({modal:true}).jqmShow();
});