// ErrorFromOnEndTag.cfc
component {

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		throw(type="OnEndTagException", message="OnEndTagException message", detail="OnEndTagException detail", errorCode="OnEndTagException errorcode", extendedInfo="OnEndTagException detail extendedInfo")
		return false
	}

	public boolean function onError(){
		dump(arguments)
	}
}