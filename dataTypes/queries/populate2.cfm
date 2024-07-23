<cfscript>
	q1 = queryNew("firstName,lastName,colour");
	queryAddRow(q1); q1.firstName[1] = "Adam"; q1.lastName[1] = "Cameron"; q1.colour[1] = "Green";
	queryAddRow(q1); q1.firstName[2] = "Aaron"; q1.lastName[2] = "Neff"; q1.colour[2] = "Blue";
	dump(var=q1, label="q1 before, #q1.columnList#");

	q2 = queryNew("animal,firstName,lastName");
	queryAddRow(q2); q2.firstName[1] = "David"; q2.lastName[1] = "McGuigan"; q2.animal[1] = "Pangolin";
	dump(var=q2, label="q2 before, #q2.columnList#");

	q1.populate(q2,2);
	dump(var=q1, label="q1 after, #q1.columnList#");
</cfscript>