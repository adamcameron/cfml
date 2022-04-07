component persistent=true {

	property name="id" fieldType="id" ormtype="long" column="tst_id" generator="native" uniquekey="uk_test";
	property name="guid" fieldType="column" column="tst_guid" dbdefault="newid()" generated="insert" uniquekey="uk_test";
	
	property name="value" fieldType="column" ormtype="string" column="tst_value";
	
}