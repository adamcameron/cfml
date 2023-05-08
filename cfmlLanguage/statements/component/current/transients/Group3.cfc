// Group3.cfc
component accessors=true {
	property property1;
	property property2;
	property property3;
	property property4;

	Group3 function init(property1="property1default", property2="property2default", property3="property3default", property4="property4default"){
		setProperty1(arguments.property1);
		setProperty2(arguments.property2);
		setProperty3(arguments.property3);
		setProperty4(arguments.property4);
		return this;
	}
	
}