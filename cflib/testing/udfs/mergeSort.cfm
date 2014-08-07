<cfscript>
// mergeSort.cfm
array function mergeSort(required array array, required function comparator){
	var arrayLength = array.len();
	if (arrayLength <= 1) {
		return array;
	}
	var middle = arrayLength \ 2;
	var leftSubArray = [];
	var rightSubArray = [];
	array.each(function(element,index){
		if (index <= middle){
			leftSubArray.append(element);
		}else{
			rightSubArray.append(element);
		}
	});

	leftSubArray = mergeSort(leftSubArray, comparator);
	rightSubArray = mergeSort(rightSubArray, comparator);

	merge = function(leftSubArray, rightSubArray, comparator){
		var result = [];
		while (leftSubArray.len() > 0 || rightSubArray.len() > 0){
			if (leftSubArray.len() > 0 && rightSubArray.len() > 0){
				if (comparator(leftSubArray[1], rightSubArray[1]) <= 0){
					result.append(leftSubArray[1]);
					leftSubArray.deleteAt(1);
				}else{
					result.append(rightSubArray[1]);
					rightSubArray.deleteAt(1);
				}
			}else if (leftSubArray.len() > 0){
				result.append(leftSubArray[1]);
				leftSubArray.deleteAt(1);
			}else if (rightSubArray.len() > 0){
				result.append(rightSubArray[1]);
				rightSubArray.deleteAt(1);
			}
		}
		return result;
	};
	return merge(leftSubArray, rightSubArray, comparator);
}	
</cfscript>