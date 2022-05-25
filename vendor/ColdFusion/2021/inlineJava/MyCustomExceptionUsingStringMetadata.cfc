component {

    public function create(required string message, required string metadata) {

        var myException = java {


            public class MyException extends java.lang.Exception {

                private String metadata;

                public MyException(String message, String metadata) {
                    super(message);
                    this.metadata = metadata;
                }

                public String getMetadata() {
                    return this.metadata;
                }
            }
        }

       return myException.init(message, metadata)
    }
}
