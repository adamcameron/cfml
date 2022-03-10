// ServerErrorResponse.cfc
component extends=Response {

    function init(exception){
        super.init(500)
        this.exception = exception
    }

}
