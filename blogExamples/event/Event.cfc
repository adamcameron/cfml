// Event.cfc
component {

	public Event function init(){
		variables.handlerMap = {};
		return this;
	}

	public void function on(required string event, required function handler){
		param name="variables.handlerMap.#event#" default=[];
		arrayAppend(variables.handlerMap[event], handler);
	}

	public void function trigger(required string event, struct data){
		if (!structKeyExists(variables.handlerMap, event)){
			return;
		}
		for (var handler in variables.handlerMap[event]){
			handler(event=event, data=data);
		}
	}

}