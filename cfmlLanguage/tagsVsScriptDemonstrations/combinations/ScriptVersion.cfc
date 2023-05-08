component {

    public array function getCombinations(required array array) {
        working = duplicate(array)
        return array.reduce((combinations=[], prefix) => {
            working.deleteAt(1)
            return combinations.append(working.map((element) => "#prefix##element#"), true)
        })
    }
}
