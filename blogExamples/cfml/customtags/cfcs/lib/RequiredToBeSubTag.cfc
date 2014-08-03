// RequiredToBeSubTag.cfc
component {

	public RequiredToBeSubTag function init(required boolean hasEndTag, BaseTag parent){
		(structKeyExists(arguments, "parent") && isInstanceOf(arguments.parent, "BaseTag")) || throw(type="InvalidTagNestingException", message="Context validation error for the RequiredToBeSubTag tag", detail="The tag must be nested inside a BaseTag tag")
		return this
	}

	public boolean function onStartTag(required struct attributes, required struct caller){
		echo(attributes.message)
		return true
	}

	public void function onError(required struct cfcatch, required string source){
		if (cfcatch.type != "InvalidTagNestingException"){
			return true
		}
		dump([cfcatch.type,cfcatch.message,cfcatch.detail])
		return false
	}

}