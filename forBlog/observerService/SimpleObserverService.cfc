component implements=ObserverService {

    variables.eventRegistry = {}

    public void function on(required string event, required function handler, any data) {
        registerEvent(event)
        variables.eventRegistry[event].append({
            handler = handler,
            data = arguments?.data
        })
    }

    public boolean function trigger(required string event, struct detail={}) {
        registerEvent(event)
        return variables.eventRegistry[event].some((eventData) => eventData.handler({
            name = event,
            data = eventData?.data,
            detail = detail
        }) == false)
    }

    private void function registerEvent(required string event) {
        if (!variables.eventRegistry.keyExists(event)) {
            variables.eventRegistry[event] = []
        }
    }
}
