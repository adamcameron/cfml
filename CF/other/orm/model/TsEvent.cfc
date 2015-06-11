component persistent=true table="tbl_ts_event" {
	property	name		= "id"
				fieldType	= "id"
				generator	= "native"
	;

	property	name		= "myName"
				fieldType	= "column"
				datatype	= "string"
	;

	property	name		= "myDate"
				fieldType	= "column"
				datatype	= "date"
	;

	function onInsert(required struct data ) {
	//	myDate = now();
	}
}