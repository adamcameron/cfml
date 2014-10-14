class Cat extends Animal {
    public Cat(String name) {
        super(name);
    }
 
    public String talk() {
    	if (false){
    		System.out.print("c");
    	}
    	if (true){
    		System.out.print("a");
    	}else{
    		System.out.print("b");
    	}
    	return "Meowww!";
    }
}
