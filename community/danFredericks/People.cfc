component {

	variables.people = [];

	function init(){

	}

	function loadFromArray(array people){
		variables.people = arguments.people.map(function(person){
			return new Person(person.firstName, person.lastName);
		});
	}

	function getArray(){
		return variables.people;
	}

	function getSortedArray(){
		var sortedPeople = duplicate(variables.people);
		sortedPeople.sort(function(person1, person2){
			var lastNameCompare = person1.lastName.compare(person2.lastName);
			return lastNameCompare != 0 ? lastNameCompare : person1.firstName.compare(person2.firstName);
		});
		return sortedPeople;
	}

}