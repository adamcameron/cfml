component {
    
    public function index ( event, rc, prc ) {
    }
    
    public function onRequestStart ( event, rc, prc ) {
        rc.startTime = getTickCount();
    }
}