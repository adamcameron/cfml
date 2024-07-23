// Reference.cfc
component persistent=true accessors=true {
	property name="id"  fieldType="id" ormtype="integer" generator="native";
	property name="articleId" ormtype="integer";
	property name="title";
	property name="link";
}