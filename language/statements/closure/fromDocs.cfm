<cfscript>
	function filterData(array data,  filterFunc){
		var filteredArray = [];
		for(emp in data){
			var include = filterFunc(emp);
			if (include) {
				arrayAppend(filteredArray,emp);
			}
		}
		return filteredArray;
	}
	
	employeeArray = [
		{name="Ray", salary=20000},
		{name="Todd", salary=9999},
		{name="Scott",salary=11000}
	];
/*	
	employeeArray = filterData(
		employeeArray,
		closure(Any employeeObj){
			return employeeObj.salary >= 10000;
		}
	);
*/


	function f(x){
		return x.salary > 11000;
	}
	
	employeeArray = filterData(employeeArray,f);
	writeDump(employeearray);

</cfscript>
