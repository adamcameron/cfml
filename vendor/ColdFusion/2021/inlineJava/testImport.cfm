<cfscript>
    testZonedDateTime = java {

        import java.util.ArrayList;

        public class TestImport {
            public static String getNumbers() {
                ArrayList<String> numbers = new ArrayList<String>();

                numbers.add("tahi");
                numbers.add("rua");
                numbers.add("toru");
                numbers.add("wha");

                return numbers.toString();
            }
        }
    }

    writeOutput(testZonedDateTime.getNumbers());
</cfscript>
