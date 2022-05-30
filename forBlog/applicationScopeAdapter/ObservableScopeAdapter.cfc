import cfml.forBlog.applicationScopeAdapter.GeneralScopeAdapter
import cfml.forBlog.observerService.ObserverService


component implements=ScopeAdapter {

    public function init(required GeneralScopeAdapter scopeAdapter, ObserverService observerService) {
        variables.scopeAdapter = arguments.scopeAdapter
        variables.observerService = arguments.observerService
    }

    public void function set(required string key, required any value) {
        variables.observerService.trigger("scope.set", arguments)
        variables.scopeAdapter.set(argumentCollection=arguments)
    }

    public any function get(required string key) {
        return variables.scopeAdapter.get(argumentCollection=arguments)
    }

}
