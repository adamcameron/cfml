<cfscript>
    testZonedDateTime = java {

        public class TestImport {
            public static String getNumbers() {
                java.util.ArrayList<String> numbers = new java.util.ArrayList<String>();

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
