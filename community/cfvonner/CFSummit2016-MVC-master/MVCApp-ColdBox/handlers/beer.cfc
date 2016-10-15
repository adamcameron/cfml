component displayname="Beer controller" {

    property name='beerService'		inject='beer'; // Dependency Injection in action!
    property name='breweryService'	inject='brewery';
    
    public void function index () {
        setNextEvent( 'beer.list' );
    }
    
    public void function list ( event, rc, prc ) {
        rc.beers = beerService.getAllBeers();
        rc.subtitle = "Beer List";
    }
    
    public void function add ( event, rc, prc ) {
        rc.beerId = 0;
        rc.breweryID = 0;
        rc.beerName = '';
        rc.beerType = '';
        rc.beerABV = 0;
        rc.beerIBU = 0;
        rc.beerTypes = beerService.getBeerTypes();
        rc.breweries = breweryService.getAllBreweries();
        rc.subtitle = 'Add Beer';
        event.setView( 'beer/edit' );
    }
    
    public void function edit ( event, rc, prc ) {
        if ( StructKeyExists( rc, 'beerId' ) && rc.beerId > 0 ) {
            var beer = beerService.getBeer( rc.beerId );
            rc.breweryId = beer.breweryId;
            rc.beerName = beer.name;
            rc.beerType = beer.Type;
            rc.beerABV = beer.ABV;
            rc.beerIBU = beer.IBU;
        }
        rc.beerTypes = beerService.getBeerTypes();
        rc.breweries = breweryService.getAllBreweries();
        rc.subtitle = 'Edit Beer';
    }
    
    public void function save ( event, rc, prc ) {
        rc.beerId = beerService.save( rc.beerId, rc.beerName, rc.breweryId,
            rc.beerType, rc.beerABV, rc.beerIBU );
        rc.subtitle = 'Edit Beer';
        setNextEvent( event='beer.edit', persist='beerID' );
    }
    
    public void function delete ( event, rc, prc ) {
        if ( event.valueExists( 'beerId' ) && rc.beerId > 0 ) {
            beerService.delete( rc.beerId );
        }
        setNextEvent( 'beer.list' );
    }
}