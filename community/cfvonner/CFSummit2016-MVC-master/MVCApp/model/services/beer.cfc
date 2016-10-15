component displayname="Beer service" accessors="true" {

    // alternate way of using Dependency Injection to load necessary objects
    public any function init ( helperService ) {
        variables.hs = helperService;
    }
    public query function getAllBeers () {
        return queryExecute( 
           "SELECT  be.id
                    ,be.breweryId
                    ,be.name
                    ,br.name AS breweryName
                    ,be.type
                    ,be.abv
                    ,be.ibu
            FROM dbo.Beer be
            LEFT JOIN dbo.Brewery br ON be.breweryId = br.id
            ORDER BY be.name ASC"
        ); // queryExecute equivalent to <cfquery>
    }
    
    public query function getBeer ( required numeric id ) {
        return queryExecute( 
           "SELECT  id
                    ,breweryId
                    ,name
                    ,type
                    ,abv
                    ,ibu
            FROM dbo.Beer
            WHERE id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } } 
            // equivalent to <cfqueryparam>
        );
    }
    
    public query function getBeerTypes () {
        return queryExecute(
           "SELECT DISTINCT type
            FROM dbo.Beer
            ORDER BY type ASC"
        );
    }
    
    public numeric function save ( numeric id = 0, string name = '', numeric breweryId, 
          string type = '', numeric abv = 0, numeric ibu = 0 ) {
        var beerExists = getBeer( id ).recordcount;
        if ( arguments.id > 0 && beerExists ) {
            queryExecute(
               "UPDATE dbo.Beer
                SET name = :name
                    ,breweryId = :breweryId 
                    ,type = :type 
                    ,abv = :abv 
                    ,ibu = :ibu
                WHERE id = :id",
                {
                    id = { value = arguments.id, cfsqltype = 'integer'},
                    name = { value = arguments.name, 
                        null = hs.isEmptyString( arguments.name ), cfsqltype = 'varchar' },
                    breweryId = { value = arguments.breweryId, 
                        null = hs.isEmptyString( arguments.breweryId ), cfsqltype = 'integer' },
                    type = { value = arguments.type, 
                        null = hs.isEmptyString( arguments.type ), cfsqltype = 'varchar' },
                    abv = { value = arguments.abv, cfsqltype = 'decimal' },
                    ibu = { value = arguments.ibu, cfsqltype = 'decimal' }
                }
            );
            return arguments.id;
        }
        else if ( arguments.id == 0 ){
            var result = '';
            queryExecute(
               "INSERT INTO dbo.Beer
                ( name, breweryId, type, abv, ibu )
                VALUES ( :name, :breweryId, :type, :abv, :ibu )",
                {
                    name = { value = arguments.name, 
                        null = hs.isEmptyString( arguments.name ), cfsqltype = 'varchar' },
                    breweryId = { value = arguments.breweryId, 
                        null = hs.isEmptyString( arguments.breweryId ), cfsqltype = 'integer' },
                    type = { value = arguments.type, 
                        null = hs.isEmptyString( arguments.type ), cfsqltype = 'varchar' },
                    abv = { value = arguments.abv, cfsqltype = 'decimal' },
                    ibu = { value = arguments.ibu, cfsqltype = 'decimal' }
                },
                { result = 'result'}
            );
            return result.generatedkey;
        }
    }
    
    public void function delete ( required numeric id ) {
        queryExecute( 
            "DELETE FROM dbo.Beer WHERE id = :id",
            { id={ value=arguments.id, cfsqltype='integer' } }
        );
    }
}