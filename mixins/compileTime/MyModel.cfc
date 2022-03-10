component {
    include "./myCoolLib.cfm";
    include "./myExcellentLib.cfm";

    function executeSomeStuff() {
        return doExcellentThing() & applyCoolness()
    }
}
