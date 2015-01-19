component accessors=true {

	property callback;

	function init(callback){
		setCallBack(callback);
	}

	function callDirect(){
		callback("direct");
	}

}