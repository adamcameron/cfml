component displayname="Brewery controller"  accessors="true" {

    property breweryService; // Dependency Injection in action!

    public any function init ( fw ) {
        variables.fw = fw;
        return this;
    }
    
    public void function default ( rc ) {
        variables.fw.redirect( action='brewery.list', append='none');
    }
    
    public void function list ( rc ) {
        rc.breweries = breweryService.getAllBreweries();
        rc.subtitle = "Brewery List";
    }
    
    public void function add ( rc ) {
        rc.breweryId = 0;
        rc.breweryName = '';
        rc.breweryCity = '';
        rc.breweryState = '';
        rc.breweryCountry = '';
        rc.subtitle = 'Add brewery';
        variables.fw.setView( 'brewery.edit' );
    }
    
    public void function edit ( rc ) {
        if ( StructKeyExists( rc, 'breweryId' ) && rc.breweryId > 0 ) {
            var brewery = breweryService.getBrewery( rc.breweryId );
            rc.breweryName = brewery.name;
            rc.breweryCity = brewery.city;
            rc.breweryState = brewery.state;
            rc.breweryCountry = brewery.country;
        }
        rc.subtitle = 'Edit Brewery';
    }
    
    public void function save ( rc ) {
        rc.breweryId = breweryservice.save( rc.breweryId, rc.breweryName,
            rc.breweryCity, rc.breweryState, rc.breweryCountry);
        rc.subtitle = 'Edit brewery';
        variables.fw.redirect( action='brewery.edit', append='breweryId');
    }
    
    public void function delete ( rc ) {
        if ( StructKeyExists( rc, 'breweryId' ) && rc.breweryId > 0 ) {
            breweryService.delete( rc.breweryId );
        }
        variables.fw.redirect( action='brewery.list', append='none');
    }
}