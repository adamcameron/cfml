sort(dataToSort, comparator){

	// sort algorithm stuff
	
	doINeedToSwapTheseItems = comparator(first, second);

	// swap the items if need be
	
	// more sort algorithm stuff
	return sortedData;
}

comparePeople(firstPerson, secondPerson){
	if (firstPerson.familyName > secondPerson.familyName){
		return true;
	}else if (firstPerson.familyName == secondPerson.familyName) {
		if (firstPerson.foreName > secondPerson.foreName){
			return true;
		}else if (firstPerson.foreName == secondPerson.foreName) {
			if (firstPerson.dob > secondPerson.dob){
				return true;
			}
		}
	}
	return false;
}


sortedPeople = sort(unsortedPeople, comparePeople);