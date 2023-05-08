<cfscript>
	aData = [
		{id=1, item="a", dateAdded=now()},
		{id=2, item="A", dateAdded=createDate(1970,2,17)},
		{id=3, item="aa", dateAdded=createDate(1968,12,20)},
		{id=4, item="AA", dateAdded=createDate(1933,2,20)},
		{id=5, item="aaa", dateAdded=createDate(1933,11,6)},
		{id=6, item="AAA", dateAdded=createDate(1959,9,1)},
		{id=7, item="b", dateAdded=createDate(1961,7,12)},
		{id=8, item="B", dateAdded=createDate(1970,12,22)},
		{id=9, item="bb", dateAdded=createDate(1969,12,24)},
		{id=10, item="BB", dateAdded=createDate(1964,12,23)},
		{id=11, item="bbb", dateAdded=createDate(1978,1,25)},
		{id=12, item="BBB", dateAdded=createDate(1990,10,4)}
	];

	q = queryNew("id,item,dateAdded", "Integer,VarChar,Date");
	for (i=1; i le arrayLen(aData); i=i+1){
		queryAddRow(q);
		querySetCell(q, "id", aData[i].id);
		querySetCell(q, "item", aData[i].item);
		querySetCell(q, "dateAdded", aData[i].dateAdded);
	}
	
	stGrid = {
		name		= "grid1",
		width		= 500,
		query		= "q",
		format		= "HTML",
		selectMode	= "browse"
	};
</cfscript>

<cfform method="post" action="#CGI.SCRIPT_NAME#">
    <cfgrid attributeCollection="#stGrid#">
		<cfgridcolumn name="id" type="numeric">
		<cfgridcolumn name="item" type="string_nocase">
		<cfgridcolumn name="dateAdded" type="date" mask="j/n/Y">
    </cfgrid>
</cfform>
