// Article.cfc
component persistent=true accessors=true {
	property name="id"  fieldType="id" ormtype="integer" generator="native";
	property name="date" ormtype="date";
	property name="title";
	property name="body";
}