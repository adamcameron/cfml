component {

	remote array function getFullNames(string suggestValue){
		var oUser = entityLoad("User", {}, "lastName,firstName");
		var aReturn = arrayNew(1);
		for (local.i=1; i <= arrayLen(oUser); i++){
			local.sFullname = oUser[i].getFullName();
			if (reFindNoCase("^#arguments.suggestValue#", local.sFullname)){ 
				arrayAppend(aReturn, local.sFullname);
			}
		}
		return aReturn;
	}
}