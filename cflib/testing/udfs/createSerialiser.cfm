<cfscript>
// createSerialiser.cfm

function createSerialiser(){
	return {
		serialise = function(required any object){
			try {
				return serializeJson({
					component = getMetadata(object).fullname,
					object		= object.serialise()
				});
			} catch (any e){
				throw(type="SerialisationFailedException", message=e.message, detail=e.detail)
			}
		},
		deserialise = function(required string string){
			try {
				var metaObject = deserializeJson(string)
				metaObject.component
				metaObject.object
			} catch (any e){
				throw(type="InvalidJsonException", message=e.message, detail=e.detail)
			}
			try {
				var componentToDeserialise	= createObject(metaObject.component)
				return componentToDeserialise.deserialise(metaObject.object)
			} catch (any e){
				throw(type="DeserialisationFailedException", message=e.message, detail=e.detail)
			}

		}
	}
}
</cfscript>