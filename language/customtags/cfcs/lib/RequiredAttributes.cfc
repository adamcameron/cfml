// RequiredAttributes.cfc
component {

	public boolean function onStartTag(required struct attributes, required struct caller){
		attributes.message ?: throw(type="MissingAttributeException", message="message attribute missing", detail="The requiredAttributes tag requires a message attribute")
		echo(attributes.message)
		return true
	}
}