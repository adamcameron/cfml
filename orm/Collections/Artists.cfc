component persistent="true"
{

/*
I have used "increment" generator here as only this generator works for Derby.  We are figuring out why "native" or "identity" doesn't work with derby
*/
	property name="artistid" generator="increment";
    
/*
All other properties are mapped here
*/
	property name="firstname";
	property name="lastname";   
	property name="address";
	property name="city";
	property name="state";
	property name="postalcode";
	property name="email";
	property name="phone";     	
	property name="fax";
	property name="thepassword";
    
/*
Here is the meaty part.  Artists have many arts and you want to just get an array of artnames made by each artist.  Note that you get an array of strings and not an array of persistent objects.
You need to set fieldtype="collection".  The other attributes for this are collectiontype, table, fkcolumn, elementtype, elementcolumn and orderby.  
collectiontype: can be "array" or "struct".
fkcolumn: If not specified, it will be figured out by inspecting the database.
elementcolumn: The name of the table column which should be the values of the array/struct.
elementtype: The datatype of the table column which should be the values of the array/struct.
orderby: The sort order for the query.
*/

	property name="ArtNamesAsArray" fieldtype="collection" table="Art" fkcolumn="artistid" elementtype="string" elementcolumn="artname" collectiontype="array" orderby="artname desc";
    
/* Here is one more property which retrieves artnames but it retrieves it as a struct.  Two additional attributes are defined for this collection type - structkeycolumn and structkeytype in addition to the above attributes.  The attributes are self explanatory.  In this example, the keys of the struct are the values of the column artid.  The values of the struct are the values of the column artname.
*/

	property name="ArtNamesAsStruct" fieldtype="collection" table="Art" fkcolumn="artistid" elementtype="string" elementcolumn="artname" structkeytype="int" structkeycolumn="artid" collectiontype="struct" orderby="artid";

}
