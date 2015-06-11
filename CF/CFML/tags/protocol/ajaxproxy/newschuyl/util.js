function serverTimeClick() {
	var instance = new proxy();
	instance.setCallbackHandler(serverTimeSuccess);
	instance.serverTime();
}

function serverTimeSuccess(result) {
	document.getElementById('output').innerHTML = result;
}

function reverseString(source) {
	var instance = new proxy();
	instance.setCallbackHandler(reverseStringSuccess);
	instance.reverseString(source);
}

function reverseStringSuccess(result) {
	document.getElementById('output').innerHTML = result;
}