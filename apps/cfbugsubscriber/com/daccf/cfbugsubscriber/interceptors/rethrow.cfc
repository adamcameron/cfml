component {
    function onException(event, interceptData) {
        throw(object=interceptData.exception);
    }
}