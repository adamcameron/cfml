// RequiredEndTag.cfc
component {

	public RequiredEndTag function init(required boolean hasEndTag){
		hasEndTag || throw(type="MissingEndTagException", message="missing end tag", detail="The requiredEndTag tag requires an end tag")
		return this
	}

	public boolean function onStartTag(required struct attributes, required struct caller){
		echo(attributes.message)
		return true
	}

}