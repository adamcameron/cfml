// Comment.cfc
component persistent=true accessors=true {
	property name="id"  fieldType="id" ormtype="integer" generator="native";
	property name="articleId" ormtype="integer";
	property name="date" ormtype="date";
	property name="author";
	property name="body";
}