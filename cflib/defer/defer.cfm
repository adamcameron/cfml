<cfscript>
public struct function defer(required function job, function onSuccess, function onFailure, function onError, function onTerminate){
	var threadId = "deferredThread_#createUuid()#";

	local[threadId] = "";

	try {
		cfthread.status = "Running";
		thread name=threadId action="run" attributecollection=arguments {
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
		if (structKeyExists(arguments, "onError")){
			onError(e);
		}else{
			rethrow;
		}
	}
	return {
		getStatus = function(){
			return cfthread.status;
		},
		getThreadId = function(){
			return threadId;
		},
		terminate = function(){
			if (cfthread.status == "Running"){
				thread name=threadId action="terminate";
				cfthread.status = "Terminated";
				if (isDefined("onTerminate")){
					onTerminate();
				}
			}
		}
	};
}
</cfscript>