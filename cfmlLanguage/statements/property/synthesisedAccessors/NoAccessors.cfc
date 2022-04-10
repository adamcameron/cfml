// NoAccessors.cfc
component accessors=false {

	property name="hasBoth"		getter=true		setter=true		default="default value for hasBoth";
	property name="hasGetter"	getter=true		setter=false	default="default value for hasGetter";
	property name="hasSetter"	getter=false	setter=true		default="default value for hasSetter";
	property name="hasNeither"	getter=false	setter=false	default="default value for hasNeither";

}