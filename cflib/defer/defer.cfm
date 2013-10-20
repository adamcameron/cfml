<cfscript>
public struct function defer(required function job, function onSuccess, function onFailure, function onError, function onTerminate){
	var deferThread = "";

	try {
		cfthread.status = "Running";
		thread name="deferThread" action="run" attributecollection=arguments {
			try {
				successData.result = job();
				cfthread.status = "Completed";
				if (isDefined("onSuccess")){
					onSuccess(successData);
				}
			} catch (any e){
				cfthread.status = "Failed";
				if (isDefined("onFailure")){
					onFailure(e);
				}else{
					rethrow;
				}
			}
		}
	} catch (any e){
		cfthread.status = "Errored";
		if (isDefined("onError")){
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