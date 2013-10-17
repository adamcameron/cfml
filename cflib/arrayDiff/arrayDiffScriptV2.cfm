<cfscript>
	array function arrayDiffV2(required array array1, required array array2, numeric threads=0, boolean removeDuplicates=true){
		var maxThreadLoop	= threads;
		var array1Len		= arrayLen(array1);

		if (threads > 0){
			var chunkSize		= ceiling(array1Len / maxThreadLoop);
			var threadName		= "";
			var threadNames		= [];
			var threadCount		= 0;
			var thisId			= "";
			for (threadCount=0; threadCount <= chunkSize; threadCount++){
				var startIdx	= threadCount * chunkSize;
				var endIdx		= min(array1Len, startIdx + chunkSize);
				threadName = createUuid();
				arrayAppend(threadNames, threadName);

				thread action="run" name=threadName startIdx=startIdx endIdx=endIdx array1=array1 array2=array2 {
					thread.chunk = array1.subList(startIdx, endIdx);
					thread.chunk.removeAll(attributes.array2);
				}

				// If we're at the end of the array, break out of the outer loop rather than do empty cfthread calls
				if (endIdx == array1Len){
					break;
				}
			}
			// Join the threads after they have completed
			thread action="join" name=arrayToList(threadNames);

			var diffedArray = [];
			for (var threadName in threadNames){
				// Combine the arrays using java
				diffedArray.addAll(cfthread[threadName].chunk);
			}

		}else{
			// No threading
			array1.removeAll(array2);
			diffedArray = duplicate(array1);
		}

		// Remove any duplicates
		if (removeDuplicates){
			writeOutput("here<br />");
			diffedArray = createObject("java", "java.util.HashSet").init(diffedArray).toArray();
		}
		return diffedArray;
	}
</cfscript>