// AnotherNumber.cfc
component {

	static.number = 0;
	
	public void function setNumber(number){
		AnotherNumber::number = number
	}
	public numeric function getNumber(){
		return AnotherNumber::number
	}
}