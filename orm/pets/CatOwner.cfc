// CatOwner.cfc
/**
*	@hint This represents a person who owns cats
*/

component persistent=true {
	
	property name="ownerId" fieldtype="id" generator="identity" ormtype="integer";
	property name="ownerName" fieldtype="column";

	property	name			= "cats"
				fieldtype		= "collection"
				table			= "Cat"
				fkcolumn		= "ownerId"
				elementtype		= "string"
				elementcolumn	= "catName"
				collectiontype	= "array"
				orderby			= "catName asc"
	;
}
