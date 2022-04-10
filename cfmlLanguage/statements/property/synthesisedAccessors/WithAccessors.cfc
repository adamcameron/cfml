// WithAccessors.cfc
component accessors=true {

	property name="hasBoth"										default="default value for hasBoth";
	property name="hasGetter"					setter=false	default="default value for hasGetter";
	property name="hasSetter"	getter=false					default="default value for hasSetter";
	property name="hasNeither"	getter=false	setter=false	default="default value for hasNeither";

}