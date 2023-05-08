import com.example.Thing;

component {
    public Thing[] function getEmptyThingsUsingLiteral() {
        return ["Thing"][]
    }

    public Thing[] function getEmptyThingsUsingArrayNew() {
        return arrayNew["Thing"](1)
    }

    public Thing[] function getArrayOfThings() {
        return [new Thing()]
    }

    public void function showsTheInitialisationIsCorrect() {
        var things = ["Thing"][]

       things.append("NOT A THING")
    }

    public any function getEmptyArrayOfThings() {
        return ["Thing"][]
    }

    public any function takesArrayOfThings(Thing[] things) {
        return things
    }
}
