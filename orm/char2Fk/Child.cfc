component persistent=true entityName="Child" {
     property name="childID" fieldtype="id" ormtype="integer" generator="identity";
     property name="parent" fieldtype="many-to-one" fkcolumn="parentId" cfc="Parent" ormtype="char" length="2" sqltype="char(2)";
}