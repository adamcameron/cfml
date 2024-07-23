// Number.cfc
component {

    function init(values) {
        local.goodValues = this.validate(arguments.values)
        variables.english = local.goodValues.english
        variables.maori = local.goodValues.maori
    }

    function setDao(dao) {
        variables.dao = arguments.dao
    }

    function validate(struct rawValues) {
        errors = []
        if (!arguments.rawValues.keyExists("english")) {
            errors.append("english is required")
        }
        if (!arguments.rawValues.keyExists("maori")) {
            errors.append("maori is required")
        }

        if (errors.len()) {
            throw(message="Validation errors", type="ValidationException", extendedInfo=serializeJson(errors));
        }
        return {english=arguments.rawValues.english, maori=arguments.rawValues.maori}
    }

    function save() {
        variables.dao.insert(variables.english, variables.maori)
    }
}
