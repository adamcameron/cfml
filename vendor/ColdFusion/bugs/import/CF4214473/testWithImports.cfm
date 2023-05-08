<cfscript>
import me.adamcameron.testbug.TestWithImports

test = new TestWithImports()

writeOutput("<hr>Shows initialisation is correct")
try {
    test.showsTheInitialisationIsCorrect() // should throw an exception
} catch (any e) {
    writeDump([message=e.message, detail=e.detail]) // Element of type String (NOT A THING) cannot be inserted in an Array of declared type com.example.Thing.
}

writeOutput("<hr>Testing return type check: Using array-literal syntax for empty array")
try {
    writeDump(test.getEmptyThingsUsingLiteral()) // errors with The value [] returned from the function getThings is not of declared type Thing[].
} catch (any e) {
    writeDump([message=e.message, detail=e.detail])
}

writeOutput("<hr>Testing return type check: Using arrayNew syntax for empty array")
try {
    writeDump(test.getEmptyThingsUsingArrayNew()) // errors with The value [] returned from the function getThings is not of declared type Thing[].
} catch (any e) {
    writeDump([message=e.message, detail=e.detail])
}

writeOutput("<hr>Testing return type check: Using populated array")
try {
    writeDump(test.getArrayOfThings()) // works fine
} catch (any e) {
    writeDump([message=e.message, detail=e.detail])
}

writeOutput("<hr>Testing param type check: Using empty array")
things = test.getEmptyArrayOfThings()
try {
    writeDump(test.takesArrayOfThings(things)) // The value [] passed to the function takesArrayOfThings is not of declared type Thing[].
} catch (any e) {
    writeDump([message=e.message, detail=e.detail])
}

writeOutput("<hr>Testing param type check: Using populated array")
things = test.getArrayOfThings()
try {
    writeDump(test.takesArrayOfThings(things)) // works fine
} catch (any e) {
    writeDump([message=e.message, detail=e.detail])
}
</cfscript>
