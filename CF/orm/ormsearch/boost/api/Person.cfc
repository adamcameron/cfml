component persistent=true table="tbl_people" indexable=true {

	property name="id" type="string" fieldtype="id" generator="native" ormtype="string" column="ppl_id" indexable=true indexstore=true;
	property name="lastName" column="ppl_lastname" ormtype="string" indexable=true indexstore=true;
	property name="firstName" column="ppl_firstname" ormtype="string" indexable=true indexstore=true;
	property name="middleNames" column="ppl_middlenames" ormtype="string" indexable=true indexstore=true;
	property name="subId" column="ppl_subid" ormtype="long";
	

}