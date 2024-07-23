component {

    loadMappings()

    private void function loadMappings() {
        thisDirectory = getDirectoryFromPath(getCurrentTemplatePath())
        this.mappings["/mine"] = "#thisDirectory#myApp"
        this.mappings["/theirs"] = "#thisDirectory#theirLib"
    }
}
