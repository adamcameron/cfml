component persistent=true {


	property name="id" fieldtype="id" generator="native";
	property name="adobeId" ormtype="integer" unique=true;
	property name="title";
	property name="status";
	property name="comments";
	property name="votes";
	property name="accounts" fieldtype="many-to-many" cfc="Account" linktable="AccountBugs" fkcolumn="BugId";


}