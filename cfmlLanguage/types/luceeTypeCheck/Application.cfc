component extends=ApplicationProxy {
    thisDirectory = getDirectoryFromPath(getCurrentTemplatePath())
    this.mappings["/com/somecompany/"] = thisDirectory & "com/somecompany/"
    this.mappings["/org/someorg/"] = thisDirectory & "org/someorg/"
    this.mappings["/myapp/"] = thisDirectory
}
