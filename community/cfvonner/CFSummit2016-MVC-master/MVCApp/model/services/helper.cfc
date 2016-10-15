component displayname="Helpful functions" {

    
    public string function isEmptyString ( required string str ) {
        return Len( Trim ( str ) ) == 0;
    }
    
}