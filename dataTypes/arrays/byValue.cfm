<cfscript>
	a = ["Adam", "Barry", "Charlie"];
	dump(var=a, label="a before");

	function changeArray(a){
		arguments.a[1] = "Angela";
		arguments.a[2] = "Barbara";
		arguments.a[3] = "Carrie";
		return arguments.a;
	}

	b = changeArray(a);
	dump(var=a, label="a after");
	dump(var=b, label="b after");
</cfscript>

<cfscript>
	st = {person1="Adam", person2="Barry", person3="Charlie"};
	dump(var=st, label="st before");

	function changeStruct(st){
		arguments.st.person1 = "Angela";
		arguments.st.person2 = "Barbara";
		arguments.st.person3 = "Carrie";
		return arguments.st;
	}

	b = changeStruct(st);
	dump(var=st, label="st after");
	dump(var=b, label="b after");
</cfscript>

