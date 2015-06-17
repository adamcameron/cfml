<cfscript>
	public any function _getOptionList(){
		return getOptionList();
	}
	application.oApiRuntime._getOptionList = _getOptionList;
	
	//writeDump(application.oApiRuntime._getOptionList());
</cfscript>