component implements=ScopeAdapter {

    public function init(required struct scope) {
        variables.scope = arguments.scope
    }

    public void function set(required string key, required any value) {
        variables.scope[key] = value
    }

    public any function get(required string key) {
        return variables.scope[key]
    }

}
