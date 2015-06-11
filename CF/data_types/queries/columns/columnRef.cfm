<cfscript>
	aFirst = ["Sean","Shigeru","Adam","Stephen","Hamad"];
	aLast = ["Corfield","Nakagaki","Cameron","Moretti","Amaral"];

	q1 = queryNew("");
	queryAddColumn(q1, "firstName", aFirst);
	queryAddColumn(q1, "lastName", aLast);
	dump(var=q1);

	arrayAppend(q1["firstName"], "Michael");
	dump(var=q1);
</cfscript>