<cfscript>
records = queryNew("");
records.addColumn("id", "integer", [1,2,3,4,5,6,7,8,9,10]);	
records.addColumn("en", "varchar", ["one","two","two","three","three","three","four","four","four","four"]);	
records.addColumn("other", "varchar", ["tahi","rua","deux","toru","trois","san","wha","quatre","shi","vier"]);

numbers = [];
loop query=records group="en" {
	number = {
		en = en,
		other = ""
	};
	loop {
		number.other = listAppend(number.other, other);
	}
	numbers.append(number);
}
writeDump([{records=records},{numbers=numbers}]);
</cfscript>