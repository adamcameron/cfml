component persistent=true indexable=true autoindex=true table="tbl_autoindexabledocument" {
	property
		name			= "id"
		type			= "numeric"
		fieldtype		= "id"
		generator		= "native"
		ormtype			= "integer"
		column			= "doc_id"
	;
	
	property
		name			= "doc"
		type			= "string"
		fieldtype		= "column"
		ormtype			= "text"
		column			= "doc_content"
		indexable		= true
		indexstore		= true
	;
}  
