<cfscript>
    MyExceptionClass = java {
        public class MyException extends java.lang.Exception {
            public MyException(String message) {
                super(message);
            }
        }
    }

    myException = MyExceptionClass.init("Hi!")

    throw(object=myException);
</cfscript>
