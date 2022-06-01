component {

    this.name = hash(createUuid())
    this.mappings["/myApp"] = getDirectoryFromPath(getCurrentTemplatePath()) & "myApp"
    writeDump(var=this.mappings, label=getCurrentTemplatePath())

}
