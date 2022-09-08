component invokeImplicitAccessor=true {

    property string firstName;
    property string middleName;
    property string lastName;

    public void function setFirstName(required string value) {
        firstName = value
    }

    public void function setMiddleName(required string value) {
        middleName = value
    }

    public void function setLastName(required string value) {
        lastName = value
    }

    public string function getFullName() {
        return "#firstName# #middleName# #lastName#"
    }
}
