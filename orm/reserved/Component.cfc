component persistent=true   {
	property name="id" fieldType="id" ormtype="long" column="comp_id";
	property name="cc_id" fieldType="column" ormtype="long" column="cc_id";
	property name="data" fieldType="column" ormtype="string" column="comp_data";
}