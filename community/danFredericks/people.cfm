<cfscript>
peopleArray = [
	{firstName="Dan", lastName="Fredericks"},
	{firstName="Adam", lastName="Tuttle"},
	{firstName="Brad", lastName="Wood"},
	{firstName="Denard", lastName="Springle"},
	{firstName="Raymond", lastName="Camden"},
	{firstName="Peter", lastName="Freitag"},
	{firstName="Adam", lastName="Cameron"}
];

people = new People();
people.loadFromArray(peopleArray);

sortedPeople = people.getSortedArray();
writeDump(var=sortedPeople, label="sorted: last, first");

writeDump(var=people.getArray(), label="still unsorted");

</cfscript>