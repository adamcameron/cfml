function validateConfirmed(message){
	if (document.getElementById("password").value !== document.getElementById("confirm").value){
		alert(message);
		return false;
	}
	return true;
}
