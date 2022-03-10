component {

    public MyModel function init(required MyRepository repository, Component facadeMapper) {
        variables.repository = repository

        if (arguments.keyExists("facadeMapper")) {
            mapFacades(facadeMapper)
        }

        return this
    }

    private void function mapFacades(facadeMapper) {
        facadeMapper.setFacadesFromMap(
            this,
            variables.repository,
            {
                "getAllObjects" = {},
                "getSomeObjects" = {"target" = "getSubsetOfObjects"},
                "getOrderedObjects" = {"access" = "public"},
                "getEnglishObjects" = {"access" = "package"}
            }
        )
        facadeMapper.setFacadesFromMap(
            this,
            new VariablesAccessor(),
            {
                "getVariables" = {"access" = "public", "bind" = false}
            }
        )
    }

    public Colour[] function getObjectsViaInjectedRepository() {
        return variables.repository.getAllObjects()
    }

    public Colour[] function getObjectsViaFacade() {
        return getAllObjects()
    }

    public Colour[] function getSomeObjectsViaFacade(string rows="all") {
        return getSubsetOfObjects(rows)
    }

    public Colour[] function getEnglishObjectsViaFacade() {
        return getEnglishObjects()
    }
}
