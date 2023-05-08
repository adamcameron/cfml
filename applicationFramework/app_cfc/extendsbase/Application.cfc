    component extends="ApplicationProxy" {
    
        public void function onApplicactionStart(){
            super.onApplicationStart();
            // stuff that's different from the parent goes here
        }    
    
        // if there's nothing different for a given handler, then don't have one in here: the super one will still fire
    
        // otherwise override each handler in a similar fashion to the onApplicationStart above, with:
        // a) a call to its super equivalent
        // b) anything that needs overriding
    
    }