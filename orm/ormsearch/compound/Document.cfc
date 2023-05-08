component persistent=true indexable=true table="tbl_document" {
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
	
	property 
		name			= "keywords" 
		fieldtype		= "many-to-many" 
		cfc				= "Keyword" 
		linktable		= "lnk_doc_kwd" 
		FKColumn		= "doc_id" 
		inversejoincolumn="kwd_id" 
		lazy			= true 
		cascade			= "all" 
		orderby			= "word"
		indexable		= true
		indexstore		= true
	;
}  
