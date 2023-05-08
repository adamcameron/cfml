<cfscript>
// quicksort.cfm
function quickSort(items, comparator) {
    var left		= 0;
    var right		= 0;
    var referencer	= {};
    var pivot   	= 0;
    var i       	= 0;
    var j       	= 0;

    if (isArray(items)){
    	referencer.items = items;
    }else{
    	referencer = items;
    }

	if (arrayLen(arguments) >= 3){
		left = arguments[3];
	}else{
		left = 1;
	}
	if (arrayLen(arguments) >= 4){
		right = arguments[4];
	}else{
		right = arrayLen(referencer.items);
	}

    if (arrayLen(referencer.items) > 1) {
		pivot   = referencer.items[(right + left) \ 2];
	    i       = left;
	    j       = right;

	    while (i <= j) {
	        while (comparator(referencer.items[i], pivot) < 0) {
	            i++;
	        }

	        while (comparator(referencer.items[j], pivot) > 0) {
	            j--;
	        }

	        if (i <= j) {
	            arrayswap(referencer.items, i, j);
	            i++;
	            j--;
	        }
	    }

        if (left < i - 1) {
            quickSort(referencer, comparator, left, i - 1);
        }

        if (i < right) {
            quickSort(referencer, comparator, i, right);
        }
    }
    return referencer.items;
}


function comparator(e1,e2){
	return compare(e1, e2);
}


letters = ["e", "b", "d", "a", "c"];

result = quickSort(letters, comparator);
</cfscript>
<cfdump var="#result#">

<cfscript>
	
reportsArray = [
  {
    Name = "My First Report",
    Group = "Group One"
  },
  {
    Name = "My Second Report",
    Group = "Group Two"
  },
  {
    Name = "My Third Report",
    Group = "Group One"
  }
];

function reportComparator(e1, e2){
	return compare(e1.group, e2.group);
}




result = quickSort(reportsArray, reportComparator);
</cfscript>
<cfdump var="#result#">
