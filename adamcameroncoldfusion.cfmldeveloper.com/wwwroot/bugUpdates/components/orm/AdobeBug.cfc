// relevant
component persistent=true {

	property name="adobeId" fieldtype="id" ormtype="integer" unique=true;
	property name="version";
	property name="title";
	property name="status";
	property name="state";
	property name="comments" ormtype="integer";
	property name="attachments" ormtype="integer";
	property name="votes" ormtype="integer";
	
}  