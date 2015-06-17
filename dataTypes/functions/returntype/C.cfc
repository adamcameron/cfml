component {

    public C function init(any logger){
        variables.logger = arguments.logger;
        return this;
    }
    
    public void function setS(string s){
        variables.s = arguments.s;
        variables.logger(text="set #arguments.s#");
    }
    
    public any function getLogger(){
        return variables.logger;
    }

}