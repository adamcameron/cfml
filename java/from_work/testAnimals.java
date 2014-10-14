public class testAnimals{
    // prints the following:
    //
    // Missy: Meowww!
    // Mr. Mistoffelees: Meowww!
    // Lassie: Arf! Arf!
    //
    public static void main(String[] args)
    {
        Animal[] animals = 
        {
            new Cat("Missy"),
            new Cat("Mr. Mistoffelees"),
            new Dog("Lassie")
        };
 
        for (Animal a : animals)
        {
            System.out.println(a.getName() + ": " + a.talk());
        }
    }
}
