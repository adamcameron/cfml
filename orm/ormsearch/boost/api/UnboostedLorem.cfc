component persistent=true indexable=true table="tbl_unboostedlorem" {
	property name="id" type="string" fieldtype="id" generator="native" ormtype="string" column="lor_id" indexable=true indexstore=true;
	property name="mainText" column="lor_maintext" ormtype="text" indexable=true indexstore=true;
	property name="subText" column="lor_subtext" ormtype="text" indexable=true indexstore=true;
	property name="mainTextParaCount" column="lor_mt_para" ormtype="integer" indexable=false;
	property name="mainTextMatchCount" column="lor_mt_match" ormtype="integer" indexable=false;
	property name="subTextParaCount" column="lor_st_para" ormtype="integer" indexable=false;
	property name="subTextMatchCount" column="lor_st_match" ormtype="integer" indexable=false;
	property name="mainTextWordCount" column="lor_mt_word" ormtype="integer" indexable=false;
	property name="subTextWordCount" column="lor_st_word" ormtype="integer" indexable=false;

}  
