// NumberController.cfc
component {

    function init(numberFactory) {
        variables.numberFactory = arguments.numberFactory
    }

    function handlePost(requestValues) {
        try {
            number = variables.numberFactory.createNumberFromStruct(requestValues)

            // other business logic being tested

            number.save()

            return new Response(201)

        }catch(ValidationException e) {
            return new ClientErrorResponse(e)
        }catch(any e) {
            return new ServerErrorResponse(e)
        }
    }
}
