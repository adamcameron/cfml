interface {
    public void function on(required string event, required function handler, any data);
    public boolean function trigger(required string event, struct detail);
}
