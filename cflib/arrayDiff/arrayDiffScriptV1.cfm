<cfscript>
	array function arrayDiffV1(required array array1, required array array2, numeric threads=0, boolean bRemoveDuplicates=true){
		var maxThreadLoop	= threads;
		var array1Len		= arrayLen(array1);

		if (threads > 0){
			var maxBatchLoop	= ceiling(array1Len / maxThreadLoop);
			var threadName		= "";
			var threadNames		= [];
			var threadCount		= 0;
			var thisId			= "";

			for (threadCount=1; threadCount <= maxThreadLoop; threadCount++){
				threadName = createUuid();
				arrayAppend(threadNames, threadName);

				thread action="run" name=threadName threadCount=threadCount maxBatchLoop=maxBatchLoop array1Len=array1Len array1=array1 array2=array2 {
					var thread.aObjectIds = [];
					for (i=1; i <= attributes.maxBatchLoop; i++){
						thisId = (attributes.maxBatchLoop*attributes.threadCount)-attributes.maxBatchLoop+i;
						if (thisId <= attributes.array1Len){
							arrayAppend(thread.aObjectIds, attributes.array1[thisId]);
						}else{
							// If we've run out of items, break out of the inner loop
							break;
						}
					}
					thread.aObjectIds.removeAll(attributes.array2);
				}

				// If we have less remaining items than the maxThreadLoop, break out of the outer loop rather than do empty cfthread calls
				if (threadCount == array1Len){
					break;
				}
			}
			// Join the threads after they have completed
			thread action="join" name=arrayToList(threadNames);

			var aItemsDiff = [];
			for (a in threadNames){
				// Combine the arrays using java
				aItemsDiff.addAll(cfthread[a].aObjectIds);
			}

		}else{
			// No threading
			array1.removeAll(array2);
			aItemsDiff = duplicate(array1);
		}

		// Remove any duplicates
		if (bRemoveDuplicates){
			aItemsDiff = createObject("java", "java.util.HashSet").init(aItemsDiff).toArray();
		}
		return aItemsDiff;
	}
</cfscript>