component {

    function init() {
        variables.status = true
    }

    function executeSomeStuff() {
        return doExcellentThing() & " " & applyCoolness()
    }

    function executeSomethingBrilliant() {
        return radiateBrilliance()
    }

    function failAtDoingItBrilliantly() {
        return doItBrilliantly()
    }

    function performBrilliantThings() {
        return shine() & " " & doItBrilliantly()
    }

    function executeSomeOtherStuff(){
        return variables.makeItBetter() & " " & this.makeBest()
    }

    function checkIfItsTheBest(){
        return variables.makeBest()
    }

    function progressStatus(){
        return variables.startOff() & " " & this.progressToBeLegendary() & " " & variables.complete()
    }

    function revert() {
        return variables.revertToNoob()
    }

    function getObjects(orderBy="id") {
        return getObjectsFromStorage(orderBy)
    }
}
