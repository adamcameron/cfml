component displayname="Brewery controller"  accessors="true" {
    
    property name='breweryService'	inject='brewery'; // Dependency Injection in action!
    
    public void function index ( event, rc, prc ) {
        setNextEvent( 'brewery.list' );
    }
    
    public void function list ( event, rc, prc ) {
        rc.breweries = breweryService.getAllBreweries();
        rc.subtitle = "Brewery List";
    }
    
    public void function add ( event, rc, prc ) {
        rc.breweryId = 0;
        rc.breweryName = '';
        rc.breweryCity = '';
        rc.breweryState = '';
        rc.breweryCountry = '';
        rc.subtitle = 'Add brewery';
        event.setView( 'brewery/edit' );
    }
    
    public void function edit ( event, rc, prc ) {
        if ( event.valueExists( 'breweryId' ) && rc.breweryId > 0 ) {
            var brewery = breweryService.getBrewery( rc.breweryId );
            rc.breweryName = brewery.name;
            rc.breweryCity = brewery.city;
            rc.breweryState = brewery.state;
            rc.breweryCountry = brewery.country;
        }
        rc.subtitle = 'Edit Brewery';
    }
    
    public void function save ( event, rc, prc ) {
        rc.breweryId = breweryservice.save( rc.breweryId, rc.breweryName,
            rc.breweryCity, rc.breweryState, rc.breweryCountry);
        rc.subtitle = 'Edit brewery';
        setNextEvent( event='brewery.edit', persist='breweryId' );
    }
    
    public void function delete ( event, rc, prc ) {
        if ( StructKeyExists( rc, 'breweryId' ) && rc.breweryId > 0 ) {
            breweryService.delete( rc.breweryId );
        }
        setNextEvent( 'brewery.list' );
    }
}