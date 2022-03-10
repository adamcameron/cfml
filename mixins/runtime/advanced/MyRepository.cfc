component {

    function init(MyDao dao) {
        variables.dao = dao
    }

    function getObjectsFromStorage(orderby="id") {
        orderBy = mapOrderBy(orderBy)
        return dao.getRecords(orderBy).reduce((array=[], record) => array.append(new Number(record.mi)))
    }

    private function mapOrderBy(property) {
        propertyColumnMap = {
            "id" = "id",
            "english" = "en",
            "maori" = "mi"
        }
        return propertyColumnMap.keyExists(property) ? propertyColumnMap[property] : "id"
    }
}
