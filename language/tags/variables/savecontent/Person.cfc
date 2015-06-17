// Person.php
component Person{

    function init(firstName, lastName){
        variables.firstName = firstName
        variables.lastName = lastName
        this.fullName = "#firstName# #lastName#"
    }

}