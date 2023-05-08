component {

	function outputNotSpecififed(){
		include "incWithOwnOutput.cfm";
		include "incWithOutOwnOutput.cfm";
	}

	function outputIsTrue() output=true {
		include "incWithOwnOutput.cfm";
		include "incWithOutOwnOutput.cfm";
	}

	function outputIsFalse() output=false {
		include "incWithOwnOutput.cfm";
		include "incWithOutOwnOutput.cfm";
	}

}