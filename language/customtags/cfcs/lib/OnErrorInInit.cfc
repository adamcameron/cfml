// OnErrorInInit.cfc
component {

	public OnErrorInInit function init(required boolean hasEndTag){
		throw(type="ForcedException", message="An exception was thrown", detail="This tags demonstrates how exceptions are handled by onError()")
		return this
	}

	public boolean function onError(required struct cfcatch, required string source){
		dump([cfcatch.type,cfcatch.message,cfcatch.detail])
		return true
	}

}