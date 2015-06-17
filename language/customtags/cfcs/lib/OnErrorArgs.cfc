// OnErrorArgs.cfc
component {

	public OnErrorArgs function init(required boolean hasEndTag){
		hasEndTag || throw(type="InitException", message="Exception thrown in init()", detail="This demonstrates the arguments onError() receives when an exception is thrown in #getFunctionCalledName()#()", extendedInfo=getFunctionCalledName(), errorCode=1)
		return this
	}

	public boolean function onStartTag(required struct attributes, required struct caller){
		attributes.throwInStartTag = attributes.throwInStartTag ?: false
		!attributes.throwInStartTag || throw(type="StartTagException", message="Exception thrown in onStartTag()", detail="This demonstrates the arguments onError() receives when an exception is thrown in #getFunctionCalledName()#()", extendedInfo=getFunctionCalledName(), errorCode=2)

		echo(attributes.message)

		return true
	}

	public boolean function onEndTag(required struct attributes, required struct caller){
		attributes.throwInEndTag = attributes.throwInEndTag ?: false
		!attributes.throwInEndTag || throw(type="EndTagException", message="Exception thrown in onEndTag()", detail="This demonstrates the arguments onError() receives when an exception is thrown in #getFunctionCalledName()#()", extendedInfo=getFunctionCalledName(), errorCode=3)
		return false
	}

	public boolean function onError(required struct cfcatch, required string source){
		dump(arguments)
		return false
	}

}