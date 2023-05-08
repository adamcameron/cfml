<cfscript>
bookQuery = QueryNew("LastName,Opt1,Opt2,Opt3");
newRow = QueryAddRow(bookQuery,5);
QuerySetCell(bookQuery, "LastName", "One",1);
QuerySetCell(bookQuery, "Opt1",true,1 );
QuerySetCell(bookQuery, "Opt2",true,1 );
QuerySetCell(bookQuery, "Opt3",true,1 );
 
QuerySetCell(bookQuery, "LastName", "Two",2);
QuerySetCell(bookQuery, "Opt1",true,2 );
QuerySetCell(bookQuery, "Opt2",true,2 );
QuerySetCell(bookQuery, "Opt3",true,2 );
 
QuerySetCell(bookQuery, "LastName", "Three",3);
QuerySetCell(bookQuery, "Opt1",true,3 );
QuerySetCell(bookQuery, "Opt2",true,3 );
QuerySetCell(bookQuery, "Opt3",true,3 );
 
QuerySetCell(bookQuery, "LastName", "Four",4);
QuerySetCell(bookQuery, "Opt1",true,4 );
QuerySetCell(bookQuery, "Opt2",true,4 );
QuerySetCell(bookQuery, "Opt3",true,4 );
 
QuerySetCell(bookQuery, "LastName", "Five",5);
QuerySetCell(bookQuery, "Opt1",true,5 );
QuerySetCell(bookQuery, "Opt2",true,5 );
QuerySetCell(bookQuery, "Opt3",true,5 );
 
</cfscript>
<cfform >
<script type="text/javascript">
function showData(val1, val2, val3)
{
    alert(val1);
}
</script>
<cfgrid         format="html"
                striperows="yes"
                title = "Favorites"
                width="900"
                autowidth="true"               
                selectmode="edit"
                selectColor = "##b6cee7"
                  query="bookQuery"
                name="Tmp"
                onchange="javascript:showData({cfgridaction},
                                       {cfgridrow},
                                       {cfgridchanged})">
<cfgridcolumn name="LastName" header="Last Name">
<cfgridcolumn name="Opt1" type="boolean" >
<cfgridcolumn name="Opt2" type="boolean" >
<cfgridcolumn name="Opt3" type="boolean" >
 
</cfgrid>
</cfform>