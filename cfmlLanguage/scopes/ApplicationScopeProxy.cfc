component {

    public function init(struct applicationScope) {
        variables.applicationScope = arguments.applicationScope
    }

    public function set(required string key, required any value) {
        lock scope="application" type="exclusive" timeout=5 throwontimeout=true {
            "variables.applicationScope.#key#" = value
        }
    }

    public any function get(required string key) {
        lock scope="application" type="readonly" timeout=5 throwontimeout=true {
            if (isDefined("variables.applicationScope.#key#")) {
                return structGet("variables.applicationScope.#key#")
            }
            throw(type="ApplicationScopeProxy.KeyNotFoundException", message="Key [#key#] not found in application scope");
        }
    }

    public void function withReadOnlyLock(required function task) {
        lock scope="application" type="readonly" timeout=5 throwontimeout=true {
            task()
        }
    }

    public void function withExclusiveLock(required function task) {
        lock scope="application" type="exclusive" timeout=5 throwontimeout=true {
            task()
        }
    }
}
