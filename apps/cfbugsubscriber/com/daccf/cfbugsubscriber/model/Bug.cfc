component {

	import com.daccf.cfbugsubscriber.orm.*;
	import com.daccf.cfbugsubscriber.services.*;

	// internal use	
	variables.bugIdRegex = "^\d+$";
	variables.validationMessages = {
		badBugId			= "A bug ID must be a positive integer",
		bugNotFound			= "The bug could not be found in the Adobe bug base"
	};

	this.bugIdRegex			= variables.bugIdRegex;
	this.validationMessages	= structCopy(variables.validationMessages);
	

	/**
	@hint Validates the passed-in data as being a valid Adobe bug.
	@bugData A struct containing at least a key "bug" which is the Adobe bug ID of the bug to validate
	*/
	public struct function validate(required struct bugData){
		var result = {
			isValid		= false,
			messages	= []
		};
		
		if (!(structKeyExists(arguments.bugData, "bug") && isValid("regex", arguments.bugData.bug, variables.bugIdRegex))){
			arrayAppend(result.messages, variables.validationMessages.badBugId);
			return result;
		}
		
		// we've got something that could be a bug ID. See if we can find it
		
		// first check if we've already checked it
		var bug = entityLoad("Bug", {adobeId=arguments.bugData.bug}, true);
		if (structKeyExists(local, "bug")){
			result.isValid = true;
			return result;
		}
		
		// we don't already know about it, so look it up @ Adobe
		var adobeBug = new AdobeBug(arguments.bugData.bug).getBug();
		
		if (adobeBug.fetched){
			// as well as using this as validation, we're going to be sneaky and store it for future reference too, because we're almost certainly gonna be referencing it shortly
			bug = create(adobeBug);

			result.isValid = true;
			return result;
		}else{
			arrayAppend(result.messages, variables.validationMessages.bugNotFound);
			return result;
		}
		
	}

	
	public com.daccf.cfbugsubscriber.orm.bug function create(required struct accountData){
		var newBug = new com.daccf.cfbugsubscriber.orm.Bug();
		newBug.setAdobeId(accountData.id);
		newBug.setTitle(accountData.title);
		newBug.setStatus(accountData.status);
		newBug.setComments(accountData.comments);
		newBug.setVotes(accountData.votes);

		entitySave(newBug);	// this will error - by design - if it's a duplicate Bug
		return newBug;
	}
	
	
	public com.daccf.cfbugsubscriber.orm.bug function get(required struct accountData){
		var bug = entityLoad("Bug", arguments.accountData, true);
		return bug;
	}
	
	
	public void function associateAccount(required numeric bugId, required numeric accountId){
		var bug = entityLoad("Bug", bugId, true);
		if (structKeyExists(local, "bug")){
			// check to see if the account is already
			var found = false;
			var accounts = bug.getAccounts();
			
			// this is a bit of a rubbish way to do this, but it's the most expedient thing I can think of short of re-querying
			for (var account in accounts){
				if (account.getId() == accountId){
					found = true;
					break;
				}
			}
			if (!found){
				// get the account & add it to the bug's accounts
				var account = entityLoad("Account", accountId, true);
				if (structKeyExists(local, "account")){
					bug.addAccount(account);
					entitySave(bug);
				}else{
					throw(
						type	= "AccountDoesNotExistException",
						message	= "Account does not exist",
						detail	= "There is no account with ID #arguments.accountId#"
					);			
				}
				
			} // if it was found, there's nothing to do: it's already associated
			
		}else{
			throw(
				type	= "BugDoesNotExistException",
				message	= "Bug does not exist",
				detail	= "There is no bug with ID #arguments.bugId#"
			);			
		}
	}
	
	
}