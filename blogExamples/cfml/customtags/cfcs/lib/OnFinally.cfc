// OnFinally.cfc
component {

	public OnFinally function init(required boolean hasEndTag){
		hasEndTag || throw(type="MissingEndTagException", message="missing end tag", detail="The requiredEndTag tag requires an end tag")
		return this
	}

	public boolean function onStartTag(required struct attributes, required struct caller){
		attributes.throwInStartTag = attributes.throwInStartTag ?: false
		!attributes.throwInStartTag || throw(type="StartTagException", message="Exception thrown in onStartTag()", detail="This tags demonstrates how exceptions are handled by onError()")

		return true
	}

	public boolean function onEndTag(required struct attributes, required struct caller){
		attributes.throwInEndTag = attributes.throwInEndTag ?: false
		!attributes.throwInEndTag || throw(type="EndTagException", message="Exception thrown in onEndTag()", detail="This tags demonstrates how exceptions are handled by onError()")
		return false
	}

	public boolean function onError(required struct cfcatch, required string source){
		dump(var=[cfcatch.type,cfcatch.message,cfcatch.detail], label="Exception caught by onError()")
		return false
	}

	public void function onFinally(){
		dump(var=arguments, label="onFinally() arguments")
	}

}