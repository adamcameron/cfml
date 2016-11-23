<cfscript>
people = queryNew("id,firstName,lastName", "integer,varchar,varchar", [
	{id=1, firstName="Donald", lastName="Duck"},
	{id=2, firstName="Donald", lastName="Cameron"},
	{id=3, firstName="Donald", lastName="Trump"},
	{id=4, firstName="Donald", lastName="Wearsyatroosas"}
]);
</cfscript>