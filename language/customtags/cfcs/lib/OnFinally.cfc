// OnFinally.cfc
component {

	public OnFinally function init(required boolean hasEndTag){
		hasEndTag || throw(type="MissingEndTagException", message="missing end tag", detail="This demonstrates how onFinally() is called even after an exception in init()")
		return this
	}

	public boolean function onStartTag(required struct attributes, required struct caller){
		attributes.throwInStartTag = attributes.throwInStartTag ?: false
		!attributes.throwInStartTag || throw(type="StartTagException", message="Exception thrown in onStartTag()", detail="This demonstrates how onFinally() is called even after an exception in onStartTag()", extendedInfo=attributes.throwInOnError?:false)

		return true
	}

	public boolean function onEndTag(required struct attributes, required struct caller){
		attributes.throwInEndTag = attributes.throwInEndTag ?: false
		!attributes.throwInEndTag || throw(type="EndTagException", message="Exception thrown in onEndTag()", detail="This demonstrates how onFinally() is called even after an exception in onEndTag()")
		return false
	}

	public boolean function onError(required struct cfcatch, required string source){
		dump(var=[cfcatch.type,cfcatch.message,cfcatch.detail], label="Exception caught by onError()")

		!(isBoolean(cfcatch.extendedInfo) && cfcatch.extendedInfo) || throw(type="OnErrorException", message="Exception thrown in onError()", detail="This demonstrates how onFinally() is called even after an exception in onError()")

		return false
	}

	public void function onFinally(){
		dump(var=arguments, label="onFinally() arguments")
	}

}