component persistent=true {
	property name="id" fieldtype="id" generator="native";
	property name="adobeId" ormtype="integer" unique=true;
	property name="status";
	property name="comments";
	property name="votes";
	property name="accounts" fieldtype="many-to-many" cfc="Account" linktable="AccountBugs" fkcolumn="BugId";
	
	public void function preInsert(){
		var adobeBug = new AdobeBug(variables.adobeId);
		var details = adobeBug.getBug();
		
		if (details.fetched){
			variables.status	= details.status;
			variables.comments	= details.comments;
			variables.votes		= details.votes;
		}else{
			throw("Invalid bug", "InvalidBugException", "Could not fetch bug #variables.adobeId# from the Adobe Bugbase.");
		}
	}
	
}