component {

    public MyRepository function init(MyDao dao) {
        variables.dao = dao
        return this
    }

    public Colour[] function getAllObjects() {
        return dao.getRecords("id", -1).reduce((array=[], record) => array.append(new Colour(record.mi)))
    }

    public Colour[] function getSomeObjects(string rows="all") {
        rows = (isValid("integer", rows) && rows > -1) ? rows : -1

        return dao.getRecords("id", rows).reduce((array=[], record) => array.append(new Colour(record.mi)))
    }

    public Colour[] function getOrderedObjects(string orderby="id") {
        orderBy = mapOrderBy(orderBy)

        return dao.getRecords(orderBy, -1).reduce((array=[], record) => array.append(new Colour(record.mi)))
    }

    public Colour[] function getEnglishObjects() {
        return dao.getRecords("id", -1).reduce((array=[], record) => array.append(new Colour(record.en)))
    }

    private string function mapOrderBy(required string property) {
        propertyColumnMap = {
            "id" = "id",
            "english" = "en",
            "maori" = "mi"
        }
        return propertyColumnMap.keyExists(property) ? propertyColumnMap[property] : "id"
    }
}
