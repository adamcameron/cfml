component {

	
public any function onCfcRequest(required string cfc, required string method, required struct args){
	var o = createObject(arguments.cfc);
	var metadata = getMetadata(o[method]); 
	
	if (structKeyExists(metadata, "access") && metadata.access == "remote"){
		return invoke(o, method, args);
	}else{
		throw(type="InvalidMethodException", message="Invalid method called", detail="The method #method# does not exists or is inaccessible remotely");
	}
}
		
		
			
			
/*
	public any function onCfcRequest(required string cfc, required string method, required struct args){
		var o = createObject(arguments.cfc);

		if (isRemoteMethod(o, method)){
			return invoke(o, method, args);
		}else{
			throw(type="InvalidMethodException", message="Invalid method called", detail="The method #method# does not exists or is inaccessible remotely");
		}
	}
*/
	private boolean function isRemoteMethod(required any object, required string method){
		do {
			var metadata = getmetadata(object);
			var methodMatch = structFindValue(getMetadata(object), arguments.method);
			if (arrayLen(methodMatch) && methodMatch[1].owner.access == "remote"){
				return true;
			}
			object = createObject(metadata.extends.fullname);
		} while (metadata.extends.fullname != "WEB-INF.cftags.component");
		return false;
	}

}