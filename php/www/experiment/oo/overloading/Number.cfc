component accessors=true {

	property name="english" default="";
	property name="maori" default="";

	public function get(){
		return {english=variables.english,maori=variables.maori};
	}

}