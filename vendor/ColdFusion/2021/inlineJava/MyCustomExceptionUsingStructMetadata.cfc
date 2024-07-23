component {

    public function create(required string message, required struct metadata) {

        var myException = java {
            import coldfusion.runtime.Struct;

            public class MyException extends java.lang.Exception {

                private Struct metadata;

                public MyException(String message, Struct metadata) {
                    super(message);
                    this.metadata = metadata;
                }

                public Struct getMetadata() {
                    return this.metadata;
                }
            }
        }

       return myException.init(message, metadata)
    }
}
