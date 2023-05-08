<cfscript>
import me.adamcameron.testbug.TestWithFullyQualifiedNames

test = new TestWithFullyQualifiedNames()

writeDump(test.getThings()) // works fine
</cfscript>
