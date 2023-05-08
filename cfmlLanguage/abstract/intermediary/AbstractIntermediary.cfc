// AbstractIntermediary.cfc
abstract component extends=Base accessors=true {

    property string someProp;

    function init() {
        setSomeProp("default")
    }

}
