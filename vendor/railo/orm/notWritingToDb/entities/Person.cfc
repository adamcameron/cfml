// Person.cfc
component persistent=true accessors=true {
	property name="id"  fieldType="id" ormtype="integer" generator="native";
	property name="firstName";
	property name="lastName";
}