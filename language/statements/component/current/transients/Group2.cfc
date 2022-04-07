// Group2.cfc
component accessors=true {
	property property1;
	property property2;
	property property3;
	property property4;

	Group2 function init(required property1, required property2, required property3, required property4){
		setProperty1(arguments.property1);
		setProperty2(arguments.property2);
		setProperty3(arguments.property3);
		setProperty4(arguments.property4);
		return this;
	}
	
}