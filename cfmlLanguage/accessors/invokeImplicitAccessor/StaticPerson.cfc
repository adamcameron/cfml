component invokeImplicitAccessor=true {

    // property name="firstName" access="private" type="string" static="true";
    // property name="lastName" access="private" type="string" static="true";

    static {
        static.firstName = ""
        static.lastName = ""
    }

    public static void function setFirstName(required string value) {
        firstName = value
    }

    public static void function setLastName(required string value) {
        lastName = value
    }

    public static string function getFullName() {
        return "#static.firstName# #static.lastName#"
    }
}
