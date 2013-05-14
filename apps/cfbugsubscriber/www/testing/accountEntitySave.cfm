<cfscript>
	import com.daccf.cfbugsubscriber.orm.*;
	newAccount = new Account();
	newAccount.setEmail(URL.email);
	newAccount.setPassword(URL.password);
	try {
		entitySave(newAccount);
	}
	catch (any e){
		writeDump(e);
	}
</cfscript>