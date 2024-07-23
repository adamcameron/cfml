// Application.cfc
component {

    this.name               = "restEncodingTest01";
    this.restSettings = {
        cfclocation         = "services",
        skipCfcWithError    = true
    };
    this.webAdminPassword   = "12345678";    // needed for Railo (which SUX)
    
    public void function onApplicationStart(){
        restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "services", "services");
    }
    
}