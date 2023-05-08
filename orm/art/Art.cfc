component persistent=true {
    property name="artid" generator="increment"; 
    property name="artname"; 
    property name="price"; 
    property name="largeimage"; 
    property name="mediaid"; 
    property name="issold";
    property name="artists" fieldtype="many-to-one" fkcolumn="artistid" cfc="Artists" lazy="true";
}