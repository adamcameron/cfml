<cfprocessingdirective pageencoding="utf-8">

<cfscript>
	c = chr(1);

	st = structNew();

	st[c] = true;	// try it as a key name
	st.key = c;		// try it as a value

	st.q = queryNew("col");
	queryAddRow(st.q);
	querySetCell(st.q, "col", c);	// try it in a query cell

	st.a = listToArray("#c#,element2");	// try it in an array
</cfscript>
<cfwddx action="cfml2wddx" input="#st#" output="w">

<cfdump var="#w#">
<cfset x = xmlParse(w)>


