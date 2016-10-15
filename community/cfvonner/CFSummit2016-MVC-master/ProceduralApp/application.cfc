component output='false' {

    this.name = hash( GetBaseTemplatePath() );
    this.applicationTimeout = CreateTimeSpan( 1, 0, 0, 0 );
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan( 0, 2, 0, 0 );
    this.datasources = {
        BeerTracker = {
            database = "BeerTracker",
            host = "localhost",
            port = "1433",
            driver = "MSSQLServer",
            username = "cfusion",
            password = "cfusion"
        }
    };
    this.datasource = "BeerTracker";
    

    public boolean function OnApplicationStart() {
        return true;
    }

    public void function OnSessionStart() {
        return;
    }

    public boolean function OnRequestStart( required string targetpage ) {
        if( lcase( right( targetpage, 3 ) ) == 'cfc') {
            structDelete( this, 'OnRequest' );
        }

        return true;
    }

    public void function OnRequest( required string targetpage ) {
        // set some application-wide settings, if not previously set or if url.reload='true'
        if ( !StructKeyExists( application, 'settings' ) ||
            ( StructKeyExists( url, 'reload' ) && URL.reload == 'true' ) ) {
            application.settings = {};
            application.settings.title = 'CFSummit2016 Procedural App';
        }

        // merge the form and url scopes together into request scope for convenience
        if ( IsDefined( 'URL') ) request.append( url );
        if ( Isdefined( 'form' ) ) request.append( form );

        // include the requested page 
        cfinclude( template=arguments.targetpage );
    }
}
