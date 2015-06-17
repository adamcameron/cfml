component persistent=true {
	property name="id" fieldType="id" ormtype="long" column="cc_id";
	property name="components" type="array" fieldtype="one-to-many" cfc="Component" fkcolumn="cc_id";
}