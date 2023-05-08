component persistent=true table="t_user" {

	property name="id" fieldtype="id" ormtype="integer" unique=true generator="native";
	property name="firstName";
	property name="lastName";
	property name="age" ormtype="integer";

}