// NumberFactory.cfc
component {
    function init(dao) {
        variables.dao = arguments.dao
    }
   
    function createNumberFromStruct(values){
        local.number = new Number(values)
        local.number.setDao(variables.dao)
       
        return local.number
    }
}