component persistent=true indexable=true table="tbl_keyword" {
	property
		name		= "id"
		type		= "numeric"
		fieldtype	= "id"
		generator	= "native"
		ormtype		= "integer"
		column		= "kwd_id"
	;
	
	property
		name		= "word"
		type		= "string"
		fieldtype	= "column"
		ormtype		= "string"
		column		= "kwd_word"
		indexable	= true
		indexstore	= true
	;
	
	property 
		name				= "documents" 
		fieldtype			= "many-to-many" 
		CFC					= "Document" 
		linktable			= "lnk_doc_kwd" 
		FKColumn			= "kwd_id" 
		inversejoincolumn	= "doc_id" 
		lazy				= true 
		cascade				= "all" 
		orderby				= "doc_id"
	;
}  
