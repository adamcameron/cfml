// Number.cfc
component {
	static {
		number = 0;
	}
		public void function setNumber(number){
			Number::number = number
		}
		public numeric function getNumber(){
			return Number::number
		}
}