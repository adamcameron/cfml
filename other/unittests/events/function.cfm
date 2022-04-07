<cfscript>
function createEventObject(){
	var eventContainer = {};
	return {
		on = function(required string event, required function handler, struct data={}){
			if (!structKeyExists(eventContainer, event)){
				eventContainer[event] = [];
			}
			arrayAppend(eventContainer[event], arguments);
		},
		trigger = function(required string event, struct additionalParameters={}){
			if (structKeyExists(eventContainer, event)){
				for (eventEntry in eventContainer[event]){
					var eventObj = {
						event = event,
						data = eventEntry.data
					};
					eventEntry.handler(event=eventObj, argumentCollection=additionalParameters);
				}
			}
		},
		off = function(required string event){
			structDelete(eventContainer, event);
		}
	};
}
</cfscript>