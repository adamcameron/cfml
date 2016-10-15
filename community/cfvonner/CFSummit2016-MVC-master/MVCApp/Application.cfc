component {

    this.name = hash( getBaseTemplatePath() );
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
    this.mappings['/framework'] = expandpath( '/MVCApp/fw1/framework' );

    function _get_framework_one() {
        if ( !structKeyExists( request, '_framework_one' ) ) {
            request._framework_one = new MyApplication({
                baseURL : "useRequestURI"
                ,trace : true
                ,reloadApplicationOnEveryRequest : false
                //,generateSES : true
                //,SESOmitIndex : true 
            });
        }
        return request._framework_one;
    }

    // delegation of lifecycle methods to FW/1:
    function onApplicationStart() {
        return _get_framework_one().onApplicationStart();
    }
    function onError( exception, event ) {
        return _get_framework_one().onError( exception, event );
    }
    function onRequest( targetPath ) {
        return _get_framework_one().onRequest( targetPath );
    }
    function onRequestEnd() {
        return _get_framework_one().onRequestEnd();
    }
    function onRequestStart( targetPath ) {
        return _get_framework_one().onRequestStart( targetPath );
    }
    function onSessionStart() {
        return _get_framework_one().onSessionStart();
    }
}
