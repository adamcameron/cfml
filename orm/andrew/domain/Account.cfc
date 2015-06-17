component persistent="true" {

	property name="username" generator="assigned" fieldtype="id" datatype="string" unique="true";
	property name="userRealName" datatype="string";
	property name="firstName" datatype="string";
	property name="lastName" datatype="string";
	property name="password" datatype="string";

	SecretPassword="my secret";

	function onInsert(required struct data ) {
		password = Encrypt(password, SecretPassword);
		dummy = "";
	}

	function onUpdate(Struct previousdata, Struct currentdata) {
//		password = "Andrew";
	}


	function Save() {
		// This is not something I am personally in favour off, super.save(this) would be better
		EntitySave(this);
	}

}