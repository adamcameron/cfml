component {
    /**
    * splits a full name in half
    */
    public static function splitFullName(required string fullName) {
        var arr=listToArray(fullName,"  ");
        return {'lastname':arr[1],'firstname':arr[2]};
    }
}
