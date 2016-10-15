component displayname="Brewery service" accessors="true" {

    // alternate way of using Dependency Injection to load necessary objects
    public any function init ( helperService ) {
        variables.hs = helperService;
    }
    
    public query function getAllBreweries () {
        return queryExecute( 
           "SELECT  id
                    ,name
                    ,city
                    ,state
                    ,country
            FROM dbo.Brewery
            ORDER BY name"
        ); // queryExecute equivalent to <cfquery>
    }
    
    public query function getBrewery ( required numeric id ) {
        return queryExecute( 
           "SELECT  id
                    ,name
                    ,city
                    ,state
                    ,country
            FROM dbo.Brewery
            WHERE id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } } // equivalent to <cfqueryparam>
        );
    }
    
    public numeric function save ( numeric id = 0, string name = '', string city='',
          string state = '', string country = '' ) {
        var breweryExists = getBrewery( id ).recordcount;
        if ( arguments.id > 0 && breweryExists ) {
            queryExecute(
               "UPDATE dbo.Brewery
                SET name = :name
                    ,city = :city
                    ,state = :state
                    ,country = :country
                WHERE id = :id",
                {
                    id = { value = arguments.id, cfsqltype = 'integer'},
                    name = { value = arguments.name, 
                        null = hs.isEmptyString( arguments.name ), cfsqltype = 'varchar' },
                    city = { value = arguments.city, 
                        null = hs.isEmptyString( arguments.city ), cfsqltype = 'varchar' },
                    state = { value = arguments.state, 
                        null = hs.isEmptyString( arguments.state ), cfsqltype = 'varchar' },
                    country = { value = arguments.country, 
                        null = hs.isEmptyString( arguments.country ), cfsqltype = 'varchar' }
                }
            );
            return arguments.id;
        }
        else if ( arguments.id == 0 ){
            var result = '';
            queryExecute(
               "INSERT INTO dbo.Brewery
                ( name, city, state, country )
                VALUES ( :name, :city, :state, :country )",
                {
                    name = { value = arguments.name, 
                        null = hs.isEmptyString( arguments.name ), cfsqltype = 'varchar' },
                    city = { value = arguments.city, 
                        null = hs.isEmptyString( arguments.city ), cfsqltype = 'varchar' },
                    state = { value = arguments.state, 
                        null = hs.isEmptyString( arguments.state ), cfsqltype = 'varchar' },
                    country = { value = arguments.country, 
                        null = hs.isEmptyString( arguments.country ), cfsqltype = 'varchar' }
                },
                { result = 'result'}
            );
            return result.generatedkey;
        }
    }
    
    public void function delete ( required numeric id ) {
        queryExecute( 
            "DELETE FROM dbo.Brewery WHERE id = :id",
            { id={ value=arguments.id, cfsqltype='integer' } }
        );
    }
}