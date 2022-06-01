component {

    this.name = hash(createUuid())
    this.mappings["/me/myApp"] = getDirectoryFromPath(getCurrentTemplatePath()) & "myApp"

    vendorDir = getDirectoryFromPath(getCurrentTemplatePath()) & "vendor"
    this.mappings["/com/vendor1"] = "#vendorDir#/vendor1"
    this.mappings["/org/vendor2"] = "#vendorDir#/vendor2"
    this.mappings["/net/vendor3"] = "#vendorDir#/vendor3"
    this.mappings["/edu/vendor4"] = "#vendorDir#/vendor4"

    writeDump(var=this.mappings, label=getCurrentTemplatePath())

}
