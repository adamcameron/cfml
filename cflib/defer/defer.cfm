<cfscript>
public struct function defer(required function job, function onSuccess, function onFailure, function onError, function onTerminate){
	var deferThread = "";

	try {
		cfthread.status = "Running";
		thread name="deferThread" action="run" attributecollection=arguments {
			try {
				successData.result = job();
				cfthread.status = "Completed";
				if (structKeyExists(attributes, "onSuccess")){
					onSuccess(successData);
				}
			} catch (any e){
				cfthread.status = "Failed";
				if (structKeyExists(attributes, "onFailure")){
					onFailure(e);
				}else{
					rethrow;
				}
			}
		}
	} catch (any e){
		cfthread.status = "Errored";
		if (structKeyExists(attributes, "onError")){
			onError(e);
		}else{
			rethrow;
		}
	}
	return {
		getStatus = function(){
			return cfthread.status;
		},
		terminate = function(){
			if (cfthread.status == "Running"){
				thread name="deferThread" action="terminate";
				cfthread.status = "Terminated";
				if (isDefined("onTerminate")){
					onTerminate();
				}
			}
		}
	};
}
</cfscript>