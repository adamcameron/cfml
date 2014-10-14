abstract class Animal implements IAnimal {
    private final String name;
 
    protected Animal(String name)
    {
        this.name = name;
    }
 
    public String getName()
    {
        return name;
    }
}
